import SwiftUI

/// A hairline horizontal rule using the border token. Named `DividerLine`
/// (rather than `Divider`) to avoid colliding with `SwiftUI.Divider`.
@MainActor
public struct DividerLine: View {
    public init() {}

    public var body: some View {
        Rectangle()
            .fill(UIColorToken.border)
            .frame(height: 1)
            .accessibilityHidden(true)
    }
}
