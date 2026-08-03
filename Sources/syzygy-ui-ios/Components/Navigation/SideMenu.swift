import SwiftUI

/// A slide-in side navigation panel (also known as a "Drawer"), presented
/// via an `isOpen` binding, sliding in from the leading edge over a dimming
/// scrim.
@MainActor
public struct SideMenu<Content: View>: View {
    @Binding private var isOpen: Bool
    private let width: CGFloat
    private let content: Content

    public init(isOpen: Binding<Bool>, width: CGFloat = 280, @ViewBuilder content: () -> Content) {
        self._isOpen = isOpen
        self.width = width
        self.content = content()
    }

    public var body: some View {
        ZStack(alignment: .leading) {
            if isOpen {
                UIColorToken.overlay
                    .opacity(UIOpacity.overlay)
                    .ignoresSafeArea()
                    .onTapGesture {
                        withAnimation(UIAnimation.Easing.standard()) { isOpen = false }
                    }
                    .transition(.opacity)

                content
                    .frame(width: width)
                    .frame(maxHeight: .infinity)
                    .background(UIColorToken.surface)
                    .elevation(UIElevation.lg)
                    .transition(.move(edge: .leading))
            }
        }
        .animation(UIAnimation.Easing.standard(), value: isOpen)
    }
}

/// Presents a `SideMenu` above the current view when `isOpen` is true,
/// mirroring the `.bottomSheet(isPresented:)` / `.modal(isPresented:)`
/// presentation-modifier convention used elsewhere in this library.
public extension View {
    @MainActor
    func sideMenu<MenuContent: View>(
        isOpen: Binding<Bool>,
        width: CGFloat = 280,
        @ViewBuilder content: @escaping () -> MenuContent
    ) -> some View {
        ZStack(alignment: .leading) {
            self
            SideMenu(isOpen: isOpen, width: width, content: content)
                .zIndex(1)
        }
    }
}
