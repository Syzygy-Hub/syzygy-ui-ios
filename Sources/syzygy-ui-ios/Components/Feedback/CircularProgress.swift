import SwiftUI

/// A circular progress indicator. Pass `progress` (0...1) for a determinate
/// partial ring, or `nil` for a continuously spinning indeterminate mode.
@MainActor
public struct CircularProgress: View {
    private let progress: Double?
    private let lineWidth: CGFloat

    @State private var isSpinning = false

    public init(progress: Double? = nil, lineWidth: CGFloat = 4) {
        self.progress = progress
        self.lineWidth = lineWidth
    }

    public var body: some View {
        ZStack {
            Circle()
                .stroke(UIColorToken.border, lineWidth: lineWidth)

            if let progress {
                Circle()
                    .trim(from: 0, to: max(0, min(1, progress)))
                    .stroke(UIColorToken.primary, style: StrokeStyle(lineWidth: lineWidth, lineCap: .round))
                    .rotationEffect(.degrees(-90))
                    .animation(UIAnimation.Easing.standard(), value: progress)
            } else {
                Circle()
                    .trim(from: 0, to: 0.25)
                    .stroke(UIColorToken.primary, style: StrokeStyle(lineWidth: lineWidth, lineCap: .round))
                    .rotationEffect(.degrees(isSpinning ? 360 : 0))
                    .animation(.linear(duration: 0.9).repeatForever(autoreverses: false), value: isSpinning)
                    .onAppear { isSpinning = true }
            }
        }
        .frame(width: 32, height: 32)
        .accessibilityLabel(progress.map { "\(Int($0 * 100)) percent" } ?? "Loading")
    }
}
