import SwiftUI

/// A star rating display. Pass `onRatingChanged` to make it interactively
/// tappable; omit it for a read-only display.
@MainActor
public struct StarRatingView: View {
    private let rating: Int
    private let maxRating: Int
    private let onRatingChanged: ((Int) -> Void)?

    public init(rating: Int, maxRating: Int = 5, onRatingChanged: ((Int) -> Void)? = nil) {
        self.rating = rating
        self.maxRating = maxRating
        self.onRatingChanged = onRatingChanged
    }

    public var body: some View {
        HStack(spacing: UISpacing.xs) {
            ForEach(1...maxRating, id: \.self) { star in
                Button {
                    onRatingChanged?(star)
                } label: {
                    Image(systemName: star <= rating ? "star.fill" : "star")
                        .foregroundStyle(star <= rating ? UIColorToken.warning : UIColorToken.textSecondary)
                        .frame(minWidth: 24, minHeight: 44)
                }
                .disabled(onRatingChanged == nil)
                .accessibilityLabel("\(star) star\(star == 1 ? "" : "s")")
            }
        }
        .accessibilityElement(children: .combine)
        .accessibilityLabel("Rating: \(rating) out of \(maxRating) stars")
    }
}
