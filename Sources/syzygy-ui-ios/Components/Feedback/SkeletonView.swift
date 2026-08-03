import SwiftUI

/// A shimmering placeholder shape (rectangle or circle) to stand in for a
/// target component while its content loads. Shares `ShimmerView`'s
/// animation implementation.
@MainActor
public struct SkeletonView: View {
    public enum Shape {
        case rectangle(cornerRadius: CGFloat = UIRadius.sm)
        case circle
    }

    private let shape: Shape
    private let width: CGFloat?
    private let height: CGFloat

    @State private var phase: CGFloat = -1

    public init(shape: Shape = .rectangle(), width: CGFloat? = nil, height: CGFloat = 16) {
        self.shape = shape
        self.width = width
        self.height = height
    }

    public var body: some View {
        content
            .frame(width: width, height: height)
            .onAppear {
                withAnimation(.linear(duration: 1.2).repeatForever(autoreverses: false)) {
                    phase = 1
                }
            }
            .accessibilityHidden(true)
    }

    @ViewBuilder
    private var content: some View {
        switch shape {
        case .rectangle(let cornerRadius):
            RoundedRectangle(cornerRadius: cornerRadius)
                .fill(UIColorToken.border.opacity(0.3))
                .overlay(shimmerOverlay.clipShape(RoundedRectangle(cornerRadius: cornerRadius)))
        case .circle:
            Circle()
                .fill(UIColorToken.border.opacity(0.3))
                .overlay(shimmerOverlay.clipShape(Circle()))
        }
    }

    private var shimmerOverlay: some View {
        GeometryReader { geometry in
            LinearGradient(
                colors: [.clear, UIColorToken.surface.opacity(0.6), .clear],
                startPoint: .leading,
                endPoint: .trailing
            )
            .frame(width: geometry.size.width * 0.6)
            .offset(x: phase * geometry.size.width * 1.5)
        }
    }
}
