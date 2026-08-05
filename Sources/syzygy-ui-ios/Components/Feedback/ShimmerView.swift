import SwiftUI

/// An animated skeleton placeholder for list/table rows while content loads.
@MainActor
public struct ShimmerView: View {
    @Environment(\.syzygyTheme) private var theme

    private let cornerRadius: CGFloat

    @State private var phase: CGFloat = -1

    public init(cornerRadius: CGFloat = UIRadius.sm) {
        self.cornerRadius = cornerRadius
    }

    public var body: some View {
        RoundedRectangle(cornerRadius: cornerRadius)
            .fill(theme.colors.border.opacity(0.3))
            .overlay(
                GeometryReader { geometry in
                    LinearGradient(
                        colors: [.clear, theme.colors.surface.opacity(0.6), .clear],
                        startPoint: .leading,
                        endPoint: .trailing
                    )
                    .frame(width: geometry.size.width * 0.6)
                    .offset(x: phase * geometry.size.width * 1.5)
                }
                .clipShape(RoundedRectangle(cornerRadius: cornerRadius))
            )
            .onAppear {
                withAnimation(.linear(duration: 1.2).repeatForever(autoreverses: false)) {
                    phase = 1
                }
            }
            .accessibilityHidden(true)
    }
}
