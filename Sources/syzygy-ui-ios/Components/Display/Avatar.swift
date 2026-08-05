import SwiftUI

/// A circular avatar showing either an image or a fallback initials label.
@MainActor
public struct Avatar: View {
    @Environment(\.syzygyTheme) private var theme

    public enum Size {
        case small
        case medium
        case large

        var dimension: CGFloat {
            switch self {
            case .small: 32
            case .medium: 44
            case .large: 64
            }
        }
    }

    private enum Content {
        case initials(String)
        case image(Image)
    }

    private let content: Content
    private let size: Size

    public init(initials: String, size: Size = .medium) {
        self.content = .initials(initials)
        self.size = size
    }

    public init(image: Image, size: Size = .medium) {
        self.content = .image(image)
        self.size = size
    }

    public var body: some View {
        ZStack {
            switch content {
            case .initials(let initials):
                Circle()
                    .fill(theme.colors.primary)
                Text(initials)
                    .font(theme.typography.headline)
                    .foregroundStyle(theme.colors.onPrimary)
            case .image(let image):
                image
                    .resizable()
                    .scaledToFill()
                    .clipShape(Circle())
            }
        }
        .frame(width: size.dimension, height: size.dimension)
        .accessibilityLabel(accessibilityText)
    }

    private var accessibilityText: String {
        switch content {
        case .initials(let initials): initials
        case .image: "Avatar"
        }
    }
}
