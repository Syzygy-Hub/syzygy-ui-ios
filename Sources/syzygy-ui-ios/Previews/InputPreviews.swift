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

#Preview("TextArea - Light") {
    TextArea(label: "Bio", text: .constant("Hello there"), placeholder: "Tell us about yourself")
        .padding()
        .preferredColorScheme(.light)
}

#Preview("TextArea - Dark") {
    TextArea(label: "Bio", text: .constant(""), placeholder: "Tell us about yourself")
        .padding()
        .preferredColorScheme(.dark)
}

#Preview("OTPInput - Light") {
    OTPInput(length: 6, code: .constant("123"))
        .padding()
        .preferredColorScheme(.light)
}

#Preview("OTPInput - Dark") {
    OTPInput(length: 6, code: .constant("123"))
        .padding()
        .preferredColorScheme(.dark)
}

#Preview("TagInput - Light") {
    TagInput(tags: .constant(["Swift", "SwiftUI"]))
        .padding()
        .preferredColorScheme(.light)
}

#Preview("TagInput - Dark") {
    TagInput(tags: .constant(["Swift", "SwiftUI"]))
        .padding()
        .preferredColorScheme(.dark)
}

#Preview("DatePickerField - Light") {
    DatePickerField(label: "Birthday", date: .constant(Date()))
        .padding()
        .preferredColorScheme(.light)
}

#Preview("DatePickerField - Dark") {
    DatePickerField(label: "Birthday", date: .constant(Date()))
        .padding()
        .preferredColorScheme(.dark)
}

#Preview("TimePickerField - Light") {
    TimePickerField(label: "Reminder", time: .constant(Date()))
        .padding()
        .preferredColorScheme(.light)
}

#Preview("TimePickerField - Dark") {
    TimePickerField(label: "Reminder", time: .constant(Date()))
        .padding()
        .preferredColorScheme(.dark)
}

#Preview("FormField - Light") {
    VStack(spacing: UISpacing.md) {
        FormField(label: "Email", errorMessage: "Enter a valid email") {
            TextField("you@example.com", text: .constant("bad"))
        }
        FormField(label: "Username", helperText: "This will be public") {
            TextField("Username", text: .constant(""))
        }
    }
    .padding()
    .preferredColorScheme(.light)
}

#Preview("FormField - Dark") {
    VStack(spacing: UISpacing.md) {
        FormField(label: "Email", errorMessage: "Enter a valid email") {
            TextField("you@example.com", text: .constant("bad"))
        }
        FormField(label: "Username", helperText: "This will be public") {
            TextField("Username", text: .constant(""))
        }
    }
    .padding()
    .preferredColorScheme(.dark)
}

#Preview("PasswordStrengthIndicator - Light") {
    VStack(spacing: UISpacing.md) {
        PasswordStrengthIndicator(password: "abc")
        PasswordStrengthIndicator(password: "Abcdef123!")
    }
    .padding()
    .preferredColorScheme(.light)
}

#Preview("PasswordStrengthIndicator - Dark") {
    VStack(spacing: UISpacing.md) {
        PasswordStrengthIndicator(password: "abc")
        PasswordStrengthIndicator(password: "Abcdef123!")
    }
    .padding()
    .preferredColorScheme(.dark)
}

#Preview("SearchableDropdown - Light") {
    SearchableDropdown(
        label: "Country", selection: .constant("USA"), options: ["USA", "Canada", "UK", "Germany"]
    ) { $0 }
        .padding()
        .preferredColorScheme(.light)
}

#Preview("SearchableDropdown - Dark") {
    SearchableDropdown(
        label: "Country", selection: .constant("USA"), options: ["USA", "Canada", "UK", "Germany"]
    ) { $0 }
        .padding()
        .preferredColorScheme(.dark)
}

#Preview("PhoneInput - Light") {
    PhoneInput(label: "Phone", selectedCountry: .constant(.defaultCountries[0]), digits: .constant("5551234567"))
        .padding()
        .preferredColorScheme(.light)
}

#Preview("PhoneInput - Dark") {
    PhoneInput(label: "Phone", selectedCountry: .constant(.defaultCountries[0]), digits: .constant("5551234567"))
        .padding()
        .preferredColorScheme(.dark)
}

#Preview("CurrencyInput - Light") {
    CurrencyInput(label: "Price", value: .constant(19.99))
        .padding()
        .preferredColorScheme(.light)
}

#Preview("CurrencyInput - Dark") {
    CurrencyInput(label: "Price", value: .constant(19.99), symbol: "€", symbolPosition: .suffix)
        .padding()
        .preferredColorScheme(.dark)
}
