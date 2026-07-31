import SwiftUI

#if canImport(UIKit)
import UIKit
#endif

/// A `ScrollView` that automatically insets its content to avoid the
/// on-screen keyboard, for forms built outside of `Form`/`List` (which
/// already handle this natively).
@MainActor
public struct KeyboardAvoidingScrollView<Content: View>: View {
    private let content: Content

    @State private var keyboardHeight: CGFloat = 0

    public init(@ViewBuilder content: () -> Content) {
        self.content = content()
    }

    public var body: some View {
        ScrollView {
            content
        }
        .safeAreaInset(edge: .bottom) {
            Color.clear.frame(height: keyboardHeight)
        }
        #if canImport(UIKit)
        .onReceive(NotificationCenter.default.publisher(for: UIResponder.keyboardWillShowNotification)) { notification in
            guard let frame = notification.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? CGRect else { return }
            keyboardHeight = frame.height
        }
        .onReceive(NotificationCenter.default.publisher(for: UIResponder.keyboardWillHideNotification)) { _ in
            keyboardHeight = 0
        }
        #endif
    }
}
