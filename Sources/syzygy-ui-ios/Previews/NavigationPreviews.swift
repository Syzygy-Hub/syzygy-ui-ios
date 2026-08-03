import SwiftUI

#Preview("BackButton - Light") {
    BackButton {}
        .padding()
        .preferredColorScheme(.light)
}

#Preview("BackButton - Dark") {
    BackButton {}
        .padding()
        .preferredColorScheme(.dark)
}

private enum PreviewTab: Hashable, Sendable {
    case home
    case search
    case profile
}

private let previewTabItems = [
    TabBarItem(tag: PreviewTab.home, systemImage: "house", label: "Home"),
    TabBarItem(tag: PreviewTab.search, systemImage: "magnifyingglass", label: "Search"),
    TabBarItem(tag: PreviewTab.profile, systemImage: "person", label: "Profile")
]

#Preview("TabBar - Light") {
    TabBar(items: previewTabItems, selection: .constant(PreviewTab.home))
        .preferredColorScheme(.light)
}

#Preview("TabBar - Dark") {
    TabBar(items: previewTabItems, selection: .constant(PreviewTab.home))
        .preferredColorScheme(.dark)
}

#Preview("BottomNavigationBar - Light") {
    BottomNavigationBar(items: previewTabItems, selection: .constant(PreviewTab.search))
        .padding()
        .preferredColorScheme(.light)
}

#Preview("BottomNavigationBar - Dark") {
    BottomNavigationBar(items: previewTabItems, selection: .constant(PreviewTab.search))
        .padding()
        .preferredColorScheme(.dark)
}

#Preview("AppBar - Light") {
    AppBar(title: "Settings") {
        BackButton {}
    } trailing: {
        IconButton(systemImage: "ellipsis", accessibilityLabel: "More") {}
    }
    .preferredColorScheme(.light)
}

#Preview("AppBar - Dark") {
    AppBar(title: "Settings") {
        BackButton {}
    } trailing: {
        IconButton(systemImage: "ellipsis", accessibilityLabel: "More") {}
    }
    .preferredColorScheme(.dark)
}

#Preview("FloatingTabBar - Light") {
    FloatingTabBar(items: previewTabItems, selection: .constant(PreviewTab.home))
        .padding()
        .preferredColorScheme(.light)
}

#Preview("FloatingTabBar - Dark") {
    FloatingTabBar(items: previewTabItems, selection: .constant(PreviewTab.home))
        .padding()
        .preferredColorScheme(.dark)
}

#Preview("SideMenu - Light") {
    Color.clear
        .sideMenu(isOpen: .constant(true)) {
            VStack(alignment: .leading, spacing: UISpacing.md) {
                Text("Menu").font(UIFontToken.title)
                Text("Home")
                Text("Settings")
            }
            .padding()
        }
        .preferredColorScheme(.light)
}

#Preview("SideMenu - Dark") {
    Color.clear
        .sideMenu(isOpen: .constant(true)) {
            VStack(alignment: .leading, spacing: UISpacing.md) {
                Text("Menu").font(UIFontToken.title)
                Text("Home")
                Text("Settings")
            }
            .padding()
        }
        .preferredColorScheme(.dark)
}

#Preview("StepIndicator - Light") {
    StepIndicator(steps: ["Cart", "Shipping", "Payment", "Review"], currentStep: 1)
        .padding()
        .preferredColorScheme(.light)
}

#Preview("StepIndicator - Dark") {
    StepIndicator(steps: ["Cart", "Shipping", "Payment", "Review"], currentStep: 1)
        .padding()
        .preferredColorScheme(.dark)
}

#Preview("Breadcrumbs - Light") {
    Breadcrumbs(items: [
        Breadcrumbs.Item(label: "Home", action: {}),
        Breadcrumbs.Item(label: "Settings", action: {}),
        Breadcrumbs.Item(label: "Profile", action: {})
    ])
    .padding()
    .preferredColorScheme(.light)
}

#Preview("Breadcrumbs - Dark") {
    Breadcrumbs(items: [
        Breadcrumbs.Item(label: "Home", action: {}),
        Breadcrumbs.Item(label: "Settings", action: {}),
        Breadcrumbs.Item(label: "Profile", action: {})
    ])
    .padding()
    .preferredColorScheme(.dark)
}
