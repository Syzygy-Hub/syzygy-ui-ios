import SwiftUI

/// A centered dialog card over a dimmed scrim. Tapping the scrim invokes
/// `onDismissBackground`, if provided.
@MainActor
public struct ModalDialog<Content: View>: View {
    private let content: Content
    private let onDismissBackground: (() -> Void)?

    public init(onDismissBackground: (() -> Void)? = nil, @ViewBuilder content: () -> Content) {
        self.onDismissBackground = onDismissBackground
        self.content = content()
    }

    public var body: some View {
        ZStack {
            Color.black.opacity(0.4)
                .ignoresSafeArea()
                .onTapGesture {
                    onDismissBackground?()
                }

            content
                .padding(UISpacing.lg)
                .background(UIColorToken.surface)
                .clipShape(RoundedRectangle(cornerRadius: UIRadius.lg))
                .shadow(color: .black.opacity(0.2), radius: 16, x: 0, y: 8)
                .padding(UISpacing.xl)
        }
    }
}

/// Presents a `ModalDialog` above the current view when `isPresented` is true.
public extension View {
    @MainActor
    func modal<ModalContent: View>(
        isPresented: Binding<Bool>,
        @ViewBuilder content: @escaping () -> ModalContent
    ) -> some View {
        ZStack {
            self

            if isPresented.wrappedValue {
                ModalDialog(
                    onDismissBackground: { isPresented.wrappedValue = false },
                    content: content
                )
                .transition(.opacity.combined(with: .scale(scale: 0.95)))
                .zIndex(1)
            }
        }
        .animation(.easeInOut(duration: 0.2), value: isPresented.wrappedValue)
    }
}
