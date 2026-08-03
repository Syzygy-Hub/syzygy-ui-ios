import SwiftUI

/// A thin, opinionated wrapper around SwiftUI's native `.popover(isPresented:)`
/// that applies this library's surface/radius/shadow token styling to the
/// popover's content, rather than reinventing overlay positioning.
public extension View {
    /// Named distinctly from the native `.popover(isPresented:content:)` to
    /// avoid overload ambiguity at call sites using trailing-closure syntax.
    @MainActor
    func styledPopover<Content: View>(
        isPresented: Binding<Bool>,
        @ViewBuilder content: @escaping () -> Content
    ) -> some View {
        self.popover(isPresented: isPresented) {
            content()
                .padding(UISpacing.md)
                .background(UIColorToken.surface)
                .clipShape(RoundedRectangle(cornerRadius: UIRadius.md))
                .elevation(UIElevation.md)
        }
    }
}
