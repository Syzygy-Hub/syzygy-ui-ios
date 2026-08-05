import SwiftUI

/// A filled call-to-action button with a built-in loading spinner state.
/// While `isLoading` is true, the label is replaced by a `ProgressView` and
/// the button is disabled.
@MainActor
public struct LoadingButton: View {
    @Environment(\.syzygyTheme) private var theme

    private let label: String
    private let isLoading: Bool
    private let action: () -> Void

    public init(label: String, isLoading: Bool, action: @escaping () -> Void) {
        self.label = label
        self.isLoading = isLoading
        self.action = action
    }

    public var body: some View {
        Button(action: action) {
            ZStack {
                Text(label)
                    .font(theme.typography.headline)
                    .opacity(isLoading ? 0 : 1)

                if isLoading {
                    ProgressView()
                        .tint(theme.colors.onPrimary)
                }
            }
            .foregroundStyle(theme.colors.onPrimary)
            .frame(maxWidth: .infinity, minHeight: 44)
            .padding(.horizontal, theme.spacing.md)
        }
        .background(theme.colors.primary.opacity(isLoading ? UIOpacity.disabled : 1))
        .clipShape(RoundedRectangle(cornerRadius: theme.radius.md))
        .disabled(isLoading)
        .accessibilityLabel(label)
        .accessibilityAddTraits(isLoading ? [] : [.isButton])
    }
}
