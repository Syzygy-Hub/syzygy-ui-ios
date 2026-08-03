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

#Preview("AdaptiveStack - Light") {
    AdaptiveStack(breakpoint: 500) {
        Text("Left").frame(maxWidth: .infinity)
        Text("Right").frame(maxWidth: .infinity)
    }
    .frame(height: 100)
    .padding()
    .preferredColorScheme(.light)
}

#Preview("AdaptiveStack - Dark") {
    AdaptiveStack(breakpoint: 500) {
        Text("Left").frame(maxWidth: .infinity)
        Text("Right").frame(maxWidth: .infinity)
    }
    .frame(height: 100)
    .padding()
    .preferredColorScheme(.dark)
}

#Preview("FlowLayout - Light") {
    FlowLayout(spacing: UISpacing.sm) {
        Chip("Swift")
        Chip("SwiftUI")
        Chip("iOS")
        Chip("Xcode")
        Chip("Design Systems")
    }
    .padding()
    .preferredColorScheme(.light)
}

#Preview("FlowLayout - Dark") {
    FlowLayout(spacing: UISpacing.sm) {
        Chip("Swift")
        Chip("SwiftUI")
        Chip("iOS")
        Chip("Xcode")
        Chip("Design Systems")
    }
    .padding()
    .preferredColorScheme(.dark)
}

#Preview("SafeAreaWrapper - Light") {
    SafeAreaWrapper(edges: [.top, .bottom]) {
        Color.blue.opacity(0.2)
    }
    .preferredColorScheme(.light)
}

#Preview("SafeAreaWrapper - Dark") {
    SafeAreaWrapper(edges: [.top, .bottom]) {
        Color.blue.opacity(0.2)
    }
    .preferredColorScheme(.dark)
}

#Preview("LabeledDivider - Light") {
    VStack(spacing: UISpacing.md) {
        LabeledDivider("OR")
        LabeledDivider("Section", alignment: .leading)
        LabeledDivider("End", alignment: .trailing)
    }
    .padding()
    .preferredColorScheme(.light)
}

#Preview("LabeledDivider - Dark") {
    VStack(spacing: UISpacing.md) {
        LabeledDivider("OR")
        LabeledDivider("Section", alignment: .leading)
        LabeledDivider("End", alignment: .trailing)
    }
    .padding()
    .preferredColorScheme(.dark)
}

#Preview("StickyHeader - Light") {
    StickyHeader {
        Text("Section Header")
            .font(UIFontToken.headline)
            .padding()
            .frame(maxWidth: .infinity, alignment: .leading)
    } content: {
        ForEach(0..<20, id: \.self) { index in
            Text("Row \(index)")
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding()
        }
    }
    .preferredColorScheme(.light)
}

#Preview("StickyHeader - Dark") {
    StickyHeader {
        Text("Section Header")
            .font(UIFontToken.headline)
            .padding()
            .frame(maxWidth: .infinity, alignment: .leading)
    } content: {
        ForEach(0..<20, id: \.self) { index in
            Text("Row \(index)")
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding()
        }
    }
    .preferredColorScheme(.dark)
}
