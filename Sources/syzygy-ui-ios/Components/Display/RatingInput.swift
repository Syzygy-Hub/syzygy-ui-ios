import SwiftUI

/// The interactive counterpart to `StarRatingView` (which is read-only).
/// Tapping a star sets `rating` and invokes `onChange`.
@MainActor
public struct RatingInput: View {
    @Environment(\.syzygyTheme) private var theme

    @Binding private var rating: Int
    private let maxRating: Int
    private let onChange: ((Int) -> Void)?

    public init(rating: Binding<Int>, maxRating: Int = 5, onChange: ((Int) -> Void)? = nil) {
        self._rating = rating
        self.maxRating = maxRating
        self.onChange = onChange
    }

    public var body: some View {
        HStack(spacing: theme.spacing.xs) {
            ForEach(1...maxRating, id: \.self) { star in
                Button {
                    rating = star
                    onChange?(star)
                } label: {
                    Image(systemName: star <= rating ? "star.fill" : "star")
                        .foregroundStyle(star <= rating ? theme.colors.warning : theme.colors.textSecondary)
                        .frame(minWidth: 24, minHeight: 44)
                }
                .accessibilityLabel("\(star) star\(star == 1 ? "" : "s")")
            }
        }
        .accessibilityElement(children: .combine)
        .accessibilityLabel("Rating: \(rating) out of \(maxRating) stars")
        .accessibilityAdjustableAction { direction in
            switch direction {
            case .increment:
                rating = Swift.min(rating + 1, maxRating)
                onChange?(rating)
            case .decrement:
                rating = Swift.max(rating - 1, 0)
                onChange?(rating)
            @unknown default:
                break
            }
        }
    }
}
