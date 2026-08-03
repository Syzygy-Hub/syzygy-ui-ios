import SwiftUI

/// An overlapping stack of `Avatar` initials, showing up to `max` avatars
/// with a trailing "+N" overflow badge for the rest.
@MainActor
public struct AvatarGroup: View {
    private let initials: [String]
    private let max: Int
    private let size: Avatar.Size

    public init(initials: [String], max: Int = 4, size: Avatar.Size = .medium) {
        self.initials = initials
        self.max = max
        self.size = size
    }

    public var body: some View {
        let visible = Array(initials.prefix(max))
        let overflow = initials.count - visible.count

        HStack(spacing: -size.dimension * 0.3) {
            ForEach(Array(visible.enumerated()), id: \.offset) { index, initial in
                Avatar(initials: initial, size: size)
                    .overlay(Circle().stroke(UIColorToken.surface, lineWidth: 2))
                    .zIndex(Double(visible.count - index))
            }

            if overflow > 0 {
                ZStack {
                    Circle()
                        .fill(UIColorToken.surfaceSecondary)
                    Text("+\(overflow)")
                        .font(UIFontToken.caption)
                        .foregroundStyle(UIColorToken.textSecondary)
                }
                .frame(width: size.dimension, height: size.dimension)
                .overlay(Circle().stroke(UIColorToken.surface, lineWidth: 2))
                .accessibilityLabel("\(overflow) more")
            }
        }
        .accessibilityElement(children: .combine)
        .accessibilityLabel("\(initials.count) people")
    }
}
