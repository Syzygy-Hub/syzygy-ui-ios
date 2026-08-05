import SwiftUI

/// A determinate linear progress indicator.
@MainActor
public struct ProgressBar: View {
    @Environment(\.syzygyTheme) private var theme

    private let progress: Double

    public init(progress: Double) {
        self.progress = min(max(progress, 0), 1)
    }

    public var body: some View {
        GeometryReader { geometry in
            ZStack(alignment: .leading) {
                RoundedRectangle(cornerRadius: theme.radius.full)
                    .fill(theme.colors.border)

                RoundedRectangle(cornerRadius: theme.radius.full)
                    .fill(theme.colors.primary)
                    .frame(width: geometry.size.width * progress)
            }
        }
        .frame(height: 8)
        .accessibilityElement()
        .accessibilityLabel("Progress")
        .accessibilityValue("\(Int(progress * 100)) percent")
    }
}
