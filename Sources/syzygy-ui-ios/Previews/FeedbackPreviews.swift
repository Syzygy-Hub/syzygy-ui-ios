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

#Preview("ShimmerView - Light") {
    VStack(spacing: UISpacing.sm) {
        ShimmerView()
            .frame(height: 16)
        ShimmerView()
            .frame(height: 16)
            .frame(maxWidth: 200)
    }
    .padding()
    .preferredColorScheme(.light)
}

#Preview("ShimmerView - Dark") {
    VStack(spacing: UISpacing.sm) {
        ShimmerView()
            .frame(height: 16)
        ShimmerView()
            .frame(height: 16)
            .frame(maxWidth: 200)
    }
    .padding()
    .preferredColorScheme(.dark)
}

#Preview("ProgressBar - Light") {
    ProgressBar(progress: 0.65)
        .padding()
        .preferredColorScheme(.light)
}

#Preview("ProgressBar - Dark") {
    ProgressBar(progress: 0.65)
        .padding()
        .preferredColorScheme(.dark)
}

#Preview("PullToRefresh - Light") {
    PullToRefresh(onRefresh: {}) {
        VStack(spacing: UISpacing.sm) {
            ForEach(0..<5, id: \.self) { index in
                Text("Row \(index)")
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding()
            }
        }
    }
    .preferredColorScheme(.light)
}

#Preview("PullToRefresh - Dark") {
    PullToRefresh(onRefresh: {}) {
        VStack(spacing: UISpacing.sm) {
            ForEach(0..<5, id: \.self) { index in
                Text("Row \(index)")
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding()
            }
        }
    }
    .preferredColorScheme(.dark)
}

#Preview("ErrorStateView - Light") {
    ErrorStateView(
        title: "Something went wrong",
        subtitle: "We couldn't load this page.",
        retryAction: {}
    )
    .preferredColorScheme(.light)
}

#Preview("ErrorStateView - Dark") {
    ErrorStateView(
        title: "Something went wrong",
        subtitle: "We couldn't load this page.",
        retryAction: {}
    )
    .preferredColorScheme(.dark)
}
