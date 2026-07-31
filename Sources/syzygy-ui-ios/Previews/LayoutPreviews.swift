import SwiftUI

#Preview("KeyboardAvoidingScrollView - Light") {
    KeyboardAvoidingScrollView {
        VStack(spacing: UISpacing.md) {
            TextInput(label: "Email", text: .constant(""), placeholder: "you@example.com")
            SecureInput(label: "Password", text: .constant(""))
        }
        .padding()
    }
    .preferredColorScheme(.light)
}

#Preview("KeyboardAvoidingScrollView - Dark") {
    KeyboardAvoidingScrollView {
        VStack(spacing: UISpacing.md) {
            TextInput(label: "Email", text: .constant(""), placeholder: "you@example.com")
            SecureInput(label: "Password", text: .constant(""))
        }
        .padding()
    }
    .preferredColorScheme(.dark)
}
