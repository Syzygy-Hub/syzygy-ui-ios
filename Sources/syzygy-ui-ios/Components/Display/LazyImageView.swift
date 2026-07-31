import SwiftUI

/// Asynchronously loads a remote image, showing a `ShimmerView` placeholder
/// while loading and a fallback glyph if the load fails.
@MainActor
public struct LazyImageView: View {
    private let url: URL?
    private let contentMode: ContentMode

    public init(url: URL?, contentMode: ContentMode = .fill) {
        self.url = url
        self.contentMode = contentMode
    }

    public var body: some View {
        AsyncImage(url: url) { phase in
            switch phase {
            case .empty:
                ShimmerView()
            case .success(let image):
                image
                    .resizable()
                    .aspectRatio(contentMode: contentMode)
            case .failure:
                ZStack {
                    UIColorToken.surface
                    Image(systemName: "photo")
                        .foregroundStyle(UIColorToken.textSecondary)
                }
            @unknown default:
                ShimmerView()
            }
        }
        .clipShape(RoundedRectangle(cornerRadius: UIRadius.sm))
        .accessibilityLabel("Image")
    }
}
