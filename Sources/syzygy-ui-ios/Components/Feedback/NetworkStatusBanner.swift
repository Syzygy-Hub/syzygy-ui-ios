import SwiftUI
#if canImport(Network)
import Network
#endif

/// Observes device connectivity via Apple's first-party `Network` framework
/// (`NWPathMonitor`) rather than a third-party reachability library, keeping
/// this package's zero-third-party-dependency goal intact.
@MainActor
public final class NetworkStatusMonitor: ObservableObject {
    @Published public private(set) var isConnected = true

    #if canImport(Network)
    private let monitor = NWPathMonitor()
    private let queue = DispatchQueue(label: "syzygy-ui-ios.NetworkStatusMonitor")
    #endif

    public init() {
        #if canImport(Network)
        monitor.pathUpdateHandler = { [weak self] path in
            Task { @MainActor in
                self?.isConnected = path.status == .satisfied
            }
        }
        monitor.start(queue: queue)
        #endif
    }

    deinit {
        #if canImport(Network)
        monitor.cancel()
        #endif
    }
}

/// A banner shown automatically when the device is offline ("No internet
/// connection"), anchored to the top or bottom edge, that auto-dismisses
/// once connectivity returns. `manualOverride` lets a consumer force-show
/// (`true`), force-hide (`false`), or defer to real network state (`nil`) —
/// useful for previews and tests.
public enum NetworkStatusBannerAlignment {
    case top
    case bottom
}

@MainActor
public struct NetworkStatusBanner: View {
    @Environment(\.syzygyTheme) private var theme

    private let alignment: NetworkStatusBannerAlignment
    private let manualOverride: Bool?
    @StateObject private var monitor = NetworkStatusMonitor()

    public init(alignment: NetworkStatusBannerAlignment = .top, manualOverride: Bool? = nil) {
        self.alignment = alignment
        self.manualOverride = manualOverride
    }

    private var isOffline: Bool {
        if let manualOverride {
            return !manualOverride
        }
        return !monitor.isConnected
    }

    public var body: some View {
        VStack {
            if alignment == .bottom { Spacer() }

            if isOffline {
                HStack(spacing: theme.spacing.sm) {
                    Image(systemName: "wifi.slash")
                    Text("No internet connection")
                        .font(theme.typography.subheadline)
                }
                .foregroundStyle(theme.colors.onPrimary)
                .padding(theme.spacing.sm)
                .frame(maxWidth: .infinity)
                .background(theme.colors.destructive)
                .transition(.move(edge: alignment == .top ? .top : .bottom).combined(with: .opacity))
            }

            if alignment == .top { Spacer() }
        }
        .animation(UIAnimation.Easing.standard(), value: isOffline)
        .accessibilityElement(children: .combine)
    }
}
