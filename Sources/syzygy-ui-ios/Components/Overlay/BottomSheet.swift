import SwiftUI

/// A bottom-anchored sheet with a grab handle and top-rounded corners.
@MainActor
public struct BottomSheet<Content: View>: View {
    private let content: Content

    public init(@ViewBuilder content: () -> Content) {
        self.content = content()
    }

    public var body: some View {
        VStack(spacing: 0) {
            Capsule()
                .fill(UIColorToken.border)
                .frame(width: 36, height: 4)
                .padding(.top, UISpacing.sm)
                .padding(.bottom, UISpacing.md)

            content
        }
        .frame(maxWidth: .infinity)
        .background(UIColorToken.surface)
        .clipShape(
            UnevenRoundedRectangle(
                topLeadingRadius: UIRadius.lg,
                bottomLeadingRadius: 0,
                bottomTrailingRadius: 0,
                topTrailingRadius: UIRadius.lg
            )
        )
        .shadow(color: .black.opacity(0.15), radius: 12, x: 0, y: -4)
    }
}

/// Presents a `BottomSheet` from the bottom edge, over a dimmed scrim, when
/// `isPresented` is true. Tapping the scrim dismisses the sheet.
public extension View {
    @MainActor
    func bottomSheet<SheetContent: View>(
        isPresented: Binding<Bool>,
        @ViewBuilder content: @escaping () -> SheetContent
    ) -> some View {
        ZStack(alignment: .bottom) {
            self

            if isPresented.wrappedValue {
                Color.black.opacity(0.4)
                    .ignoresSafeArea()
                    .onTapGesture { isPresented.wrappedValue = false }
                    .transition(.opacity)

                BottomSheet(content: content)
                    .transition(.modalPresentationTransition)
                    .zIndex(1)
            }
        }
        .animation(.easeInOut(duration: 0.25), value: isPresented.wrappedValue)
    }
}
