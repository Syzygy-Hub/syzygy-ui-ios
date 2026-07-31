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

#Preview("PagerView - Light") {
    PagerView(currentPage: .constant(0)) {
        Color.red.tag(0)
        Color.green.tag(1)
        Color.blue.tag(2)
    }
    .frame(height: 200)
    .preferredColorScheme(.light)
}

#Preview("PagerView - Dark") {
    PagerView(currentPage: .constant(0)) {
        Color.red.tag(0)
        Color.green.tag(1)
        Color.blue.tag(2)
    }
    .frame(height: 200)
    .preferredColorScheme(.dark)
}
