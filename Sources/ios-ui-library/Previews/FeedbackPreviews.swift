import SwiftUI

#Preview("LoadingView - Light") {
    LoadingView(message: "Loading...")
        .preferredColorScheme(.light)
}

#Preview("LoadingView - Dark") {
    LoadingView(message: "Loading...")
        .preferredColorScheme(.dark)
}

#Preview("EmptyStateView - Light") {
    EmptyStateView(
        systemImage: "tray",
        title: "No Items",
        subtitle: "You don't have any items yet.",
        ctaTitle: "Add Item",
        ctaAction: {}
    )
    .preferredColorScheme(.light)
}

#Preview("EmptyStateView - Dark") {
    EmptyStateView(
        systemImage: "tray",
        title: "No Items",
        subtitle: "You don't have any items yet.",
        ctaTitle: "Add Item",
        ctaAction: {}
    )
    .preferredColorScheme(.dark)
}

#Preview("ToastView - Light") {
    VStack(spacing: UISpacing.md) {
        ToastView(message: "Saved successfully", style: .success)
        ToastView(message: "Check your connection", style: .warning)
        ToastView(message: "Something went wrong", style: .error)
    }
    .padding()
    .preferredColorScheme(.light)
}

#Preview("ToastView - Dark") {
    VStack(spacing: UISpacing.md) {
        ToastView(message: "Saved successfully", style: .success)
        ToastView(message: "Check your connection", style: .warning)
        ToastView(message: "Something went wrong", style: .error)
    }
    .padding()
    .preferredColorScheme(.dark)
}
