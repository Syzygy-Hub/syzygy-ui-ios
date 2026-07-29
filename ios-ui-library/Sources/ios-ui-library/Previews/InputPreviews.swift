import SwiftUI

#Preview("TextInput - Light") {
    VStack(spacing: UISpacing.md) {
        TextInput(label: "Email", text: .constant(""), placeholder: "you@example.com")
        TextInput(label: "Email", text: .constant("bad"), placeholder: "you@example.com", errorMessage: "Enter a valid email")
        TextInput(label: "Bio", text: .constant("Hello there"), placeholder: "Tell us about yourself", maxLength: 100)
    }
    .padding()
    .preferredColorScheme(.light)
}

#Preview("TextInput - Dark") {
    VStack(spacing: UISpacing.md) {
        TextInput(label: "Email", text: .constant(""), placeholder: "you@example.com")
        TextInput(label: "Email", text: .constant("bad"), placeholder: "you@example.com", errorMessage: "Enter a valid email")
        TextInput(label: "Bio", text: .constant("Hello there"), placeholder: "Tell us about yourself", maxLength: 100)
    }
    .padding()
    .preferredColorScheme(.dark)
}

#Preview("SecureInput - Light") {
    SecureInput(label: "Password", text: .constant("hunter2"), placeholder: "Password")
        .padding()
        .preferredColorScheme(.light)
}

#Preview("SecureInput - Dark") {
    SecureInput(label: "Password", text: .constant("hunter2"), placeholder: "Password")
        .padding()
        .preferredColorScheme(.dark)
}
