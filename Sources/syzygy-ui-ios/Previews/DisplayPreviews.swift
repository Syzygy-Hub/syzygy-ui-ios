import SwiftUI

#Preview("Avatar - Light") {
    HStack(spacing: UISpacing.md) {
        Avatar(initials: "AK", size: .small)
        Avatar(initials: "AK", size: .medium)
        Avatar(initials: "AK", size: .large)
    }
    .padding()
    .preferredColorScheme(.light)
}

#Preview("Avatar - Dark") {
    HStack(spacing: UISpacing.md) {
        Avatar(initials: "AK", size: .small)
        Avatar(initials: "AK", size: .medium)
        Avatar(initials: "AK", size: .large)
    }
    .padding()
    .preferredColorScheme(.dark)
}

#Preview("DividerView - Light") {
    VStack(spacing: UISpacing.md) {
        Text("Above")
        DividerView()
        Text("Below")
    }
    .padding()
    .preferredColorScheme(.light)
}

#Preview("DividerView - Dark") {
    VStack(spacing: UISpacing.md) {
        Text("Above")
        DividerView()
        Text("Below")
    }
    .padding()
    .preferredColorScheme(.dark)
}

#Preview("Chip - Light") {
    HStack(spacing: UISpacing.sm) {
        Chip("Swift")
        Chip("SwiftUI", onRemove: {})
    }
    .padding()
    .preferredColorScheme(.light)
}

#Preview("Chip - Dark") {
    HStack(spacing: UISpacing.sm) {
        Chip("Swift")
        Chip("SwiftUI", onRemove: {})
    }
    .padding()
    .preferredColorScheme(.dark)
}

#Preview("ListRow - Light") {
    VStack(spacing: 0) {
        ListRow(title: "Settings", subtitle: "Manage your preferences", systemImage: "gearshape") {}
        DividerView()
        ListRow(title: "Notifications", systemImage: "bell") {
            Image(systemName: "chevron.right")
                .foregroundStyle(UIColorToken.textSecondary)
        }
    }
    .preferredColorScheme(.light)
}

#Preview("ListRow - Dark") {
    VStack(spacing: 0) {
        ListRow(title: "Settings", subtitle: "Manage your preferences", systemImage: "gearshape") {}
        DividerView()
        ListRow(title: "Notifications", systemImage: "bell") {
            Image(systemName: "chevron.right")
                .foregroundStyle(UIColorToken.textSecondary)
        }
    }
    .preferredColorScheme(.dark)
}

#Preview("SectionHeader - Light") {
    SectionHeader("Recent Activity", actionTitle: "See All") {}
        .preferredColorScheme(.light)
}

#Preview("SectionHeader - Dark") {
    SectionHeader("Recent Activity", actionTitle: "See All") {}
        .preferredColorScheme(.dark)
}

#Preview("LazyImageView - Light") {
    LazyImageView(url: URL(string: "https://example.com/photo.jpg"))
        .frame(width: 120, height: 120)
        .padding()
        .preferredColorScheme(.light)
}

#Preview("LazyImageView - Dark") {
    LazyImageView(url: nil)
        .frame(width: 120, height: 120)
        .padding()
        .preferredColorScheme(.dark)
}

#Preview("CountBadge - Light") {
    HStack(spacing: UISpacing.lg) {
        Image(systemName: "bell").overlay(alignment: .topTrailing) {
            CountBadge(count: 3).offset(x: 8, y: -8)
        }
        Image(systemName: "envelope").overlay(alignment: .topTrailing) {
            CountBadge(count: 128).offset(x: 8, y: -8)
        }
        Image(systemName: "gearshape").overlay(alignment: .topTrailing) {
            CountBadge().offset(x: 4, y: -4)
        }
    }
    .padding()
    .preferredColorScheme(.light)
}

#Preview("CountBadge - Dark") {
    HStack(spacing: UISpacing.lg) {
        Image(systemName: "bell").overlay(alignment: .topTrailing) {
            CountBadge(count: 3).offset(x: 8, y: -8)
        }
        Image(systemName: "envelope").overlay(alignment: .topTrailing) {
            CountBadge(count: 128).offset(x: 8, y: -8)
        }
    }
    .padding()
    .preferredColorScheme(.dark)
}

#Preview("StarRatingView - Light") {
    VStack(spacing: UISpacing.md) {
        StarRatingView(rating: 3)
        StarRatingView(rating: 0, onRatingChanged: { _ in })
    }
    .padding()
    .preferredColorScheme(.light)
}

#Preview("StarRatingView - Dark") {
    VStack(spacing: UISpacing.md) {
        StarRatingView(rating: 3)
        StarRatingView(rating: 0, onRatingChanged: { _ in })
    }
    .padding()
    .preferredColorScheme(.dark)
}
