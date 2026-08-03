import SwiftUI

#Preview("PrimaryButton - Light") {
    PrimaryButton("Continue") {}
        .padding()
        .preferredColorScheme(.light)
}

#Preview("PrimaryButton - Dark") {
    PrimaryButton("Continue") {}
        .padding()
        .preferredColorScheme(.dark)
}

#Preview("SecondaryButton - Light") {
    SecondaryButton("Cancel") {}
        .padding()
        .preferredColorScheme(.light)
}

#Preview("SecondaryButton - Dark") {
    SecondaryButton("Cancel") {}
        .padding()
        .preferredColorScheme(.dark)
}

#Preview("DestructiveButton - Light") {
    DestructiveButton("Delete Account") {}
        .padding()
        .preferredColorScheme(.light)
}

#Preview("DestructiveButton - Dark") {
    DestructiveButton("Delete Account") {}
        .padding()
        .preferredColorScheme(.dark)
}

#Preview("GhostButton - Light") {
    GhostButton("Learn More") {}
        .padding()
        .preferredColorScheme(.light)
}

#Preview("GhostButton - Dark") {
    GhostButton("Learn More") {}
        .padding()
        .preferredColorScheme(.dark)
}

#Preview("IconButton - Light") {
    IconButton(systemImage: "heart", accessibilityLabel: "Favorite") {}
        .padding()
        .preferredColorScheme(.light)
}

#Preview("IconButton - Dark") {
    IconButton(systemImage: "heart", accessibilityLabel: "Favorite") {}
        .padding()
        .preferredColorScheme(.dark)
}

#Preview("LoadingButton - Light") {
    VStack(spacing: UISpacing.md) {
        LoadingButton(label: "Submit", isLoading: false) {}
        LoadingButton(label: "Submit", isLoading: true) {}
    }
    .padding()
    .preferredColorScheme(.light)
}

#Preview("LoadingButton - Dark") {
    VStack(spacing: UISpacing.md) {
        LoadingButton(label: "Submit", isLoading: false) {}
        LoadingButton(label: "Submit", isLoading: true) {}
    }
    .padding()
    .preferredColorScheme(.dark)
}

#Preview("FloatingActionButton - Light") {
    FloatingActionButton(systemName: "plus", accessibilityLabel: "Add") {}
        .padding()
        .preferredColorScheme(.light)
}

#Preview("FloatingActionButton - Dark") {
    FloatingActionButton(systemName: "plus", accessibilityLabel: "Add") {}
        .padding()
        .preferredColorScheme(.dark)
}

#Preview("ButtonGroup - Light") {
    ButtonGroup(options: ["Day", "Week", "Month"], selection: .constant("Week"))
        .padding()
        .preferredColorScheme(.light)
}

#Preview("ButtonGroup - Dark") {
    ButtonGroup(options: ["Day", "Week", "Month"], selection: .constant(Set(["Week"])), multiSelect: true)
        .padding()
        .preferredColorScheme(.dark)
}
