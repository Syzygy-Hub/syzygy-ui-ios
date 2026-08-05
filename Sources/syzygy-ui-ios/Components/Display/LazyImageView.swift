import SwiftUI

/// Asynchronously loads a remote image, showing a `ShimmerView` placeholder
/// while loading and a fallback glyph if the load fails.
@MainActor
public struct LazyImageView: View {
    @Environment(\.syzygyTheme) private var theme

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
                    theme.colors.surface
                    Image(systemName: "photo")
                        .foregroundStyle(theme.colors.textSecondary)
                }
            @unknown default:
                ShimmerView()
            }
        }
        .clipShape(RoundedRectangle(cornerRadius: theme.radius.sm))
        .accessibilityLabel("Image")
    }
}
