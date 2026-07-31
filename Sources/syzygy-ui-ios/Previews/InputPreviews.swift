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

#Preview("SearchBar - Light") {
    SearchBar(text: .constant("Coffee"))
        .padding()
        .preferredColorScheme(.light)
}

#Preview("SearchBar - Dark") {
    SearchBar(text: .constant(""), placeholder: "Search products")
        .padding()
        .preferredColorScheme(.dark)
}

#Preview("ToggleSwitch - Light") {
    VStack(spacing: UISpacing.md) {
        ToggleSwitch(label: "Notifications", isOn: .constant(true))
        ToggleSwitch(label: "Dark Mode", isOn: .constant(false))
    }
    .padding()
    .preferredColorScheme(.light)
}

#Preview("ToggleSwitch - Dark") {
    VStack(spacing: UISpacing.md) {
        ToggleSwitch(label: "Notifications", isOn: .constant(true))
        ToggleSwitch(label: "Dark Mode", isOn: .constant(false))
    }
    .padding()
    .preferredColorScheme(.dark)
}

#Preview("Checkbox - Light") {
    VStack(spacing: UISpacing.md) {
        Checkbox(label: "Remember me", isChecked: .constant(true))
        Checkbox(label: "Subscribe to newsletter", isChecked: .constant(false))
    }
    .padding()
    .preferredColorScheme(.light)
}

#Preview("Checkbox - Dark") {
    VStack(spacing: UISpacing.md) {
        Checkbox(label: "Remember me", isChecked: .constant(true))
        Checkbox(label: "Subscribe to newsletter", isChecked: .constant(false))
    }
    .padding()
    .preferredColorScheme(.dark)
}

#Preview("RadioButton - Light") {
    VStack(spacing: UISpacing.md) {
        RadioButton(label: "Small", isSelected: true) {}
        RadioButton(label: "Large", isSelected: false) {}
    }
    .padding()
    .preferredColorScheme(.light)
}

#Preview("RadioButton - Dark") {
    VStack(spacing: UISpacing.md) {
        RadioButton(label: "Small", isSelected: true) {}
        RadioButton(label: "Large", isSelected: false) {}
    }
    .padding()
    .preferredColorScheme(.dark)
}

#Preview("SliderInput - Light") {
    SliderInput(label: "Volume", value: .constant(0.6))
        .padding()
        .preferredColorScheme(.light)
}

#Preview("SliderInput - Dark") {
    SliderInput(label: "Volume", value: .constant(0.6))
        .padding()
        .preferredColorScheme(.dark)
}

#Preview("Dropdown - Light") {
    Dropdown(label: "Country", selection: .constant("USA"), options: ["USA", "Canada", "UK"]) { $0 }
        .padding()
        .preferredColorScheme(.light)
}

#Preview("Dropdown - Dark") {
    Dropdown(label: "Country", selection: .constant("USA"), options: ["USA", "Canada", "UK"]) { $0 }
        .padding()
        .preferredColorScheme(.dark)
}

#Preview("SegmentedControl - Light") {
    SegmentedControl(options: ["Day", "Week", "Month"], selection: .constant("Week")) { $0 }
        .padding()
        .preferredColorScheme(.light)
}

#Preview("SegmentedControl - Dark") {
    SegmentedControl(options: ["Day", "Week", "Month"], selection: .constant("Week")) { $0 }
        .padding()
        .preferredColorScheme(.dark)
}

#Preview("QuantityStepper - Light") {
    QuantityStepper(value: .constant(3))
        .padding()
        .preferredColorScheme(.light)
}

#Preview("QuantityStepper - Dark") {
    QuantityStepper(value: .constant(3))
        .padding()
        .preferredColorScheme(.dark)
}
