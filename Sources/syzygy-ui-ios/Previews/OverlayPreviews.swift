import SwiftUI

#Preview("ModalView - Light") {
    ModalView {
        VStack(spacing: UISpacing.md) {
            Text("Delete item?")
                .font(UIFontToken.title)
                .foregroundStyle(UIColorToken.textPrimary)
            Text("This action cannot be undone.")
                .font(UIFontToken.body)
                .foregroundStyle(UIColorToken.textSecondary)
            DestructiveButton("Delete") {}
        }
    }
    .preferredColorScheme(.light)
}

#Preview("ModalView - Dark") {
    ModalView {
        VStack(spacing: UISpacing.md) {
            Text("Delete item?")
                .font(UIFontToken.title)
                .foregroundStyle(UIColorToken.textPrimary)
            Text("This action cannot be undone.")
                .font(UIFontToken.body)
                .foregroundStyle(UIColorToken.textSecondary)
            DestructiveButton("Delete") {}
        }
    }
    .preferredColorScheme(.dark)
}

#Preview("BottomSheet - Light") {
    VStack {
        Spacer()
        BottomSheet {
            VStack(alignment: .leading, spacing: UISpacing.md) {
                Text("Share")
                    .font(UIFontToken.title)
                    .foregroundStyle(UIColorToken.textPrimary)
                Text("Choose how you'd like to share this.")
                    .font(UIFontToken.body)
                    .foregroundStyle(UIColorToken.textSecondary)
            }
            .padding(UISpacing.lg)
        }
    }
    .preferredColorScheme(.light)
}

#Preview("BottomSheet - Dark") {
    VStack {
        Spacer()
        BottomSheet {
            VStack(alignment: .leading, spacing: UISpacing.md) {
                Text("Share")
                    .font(UIFontToken.title)
                    .foregroundStyle(UIColorToken.textPrimary)
                Text("Choose how you'd like to share this.")
                    .font(UIFontToken.body)
                    .foregroundStyle(UIColorToken.textSecondary)
            }
            .padding(UISpacing.lg)
        }
    }
    .preferredColorScheme(.dark)
}

#Preview("CollapsibleView - Light") {
    CollapsibleView(title: "Shipping details", initiallyExpanded: true) {
        Text("Delivered in 3-5 business days.")
            .font(UIFontToken.body)
            .foregroundStyle(UIColorToken.textSecondary)
    }
    .padding()
    .preferredColorScheme(.light)
}

#Preview("CollapsibleView - Dark") {
    CollapsibleView(title: "Shipping details") {
        Text("Delivered in 3-5 business days.")
            .font(UIFontToken.body)
            .foregroundStyle(UIColorToken.textSecondary)
    }
    .padding()
    .preferredColorScheme(.dark)
}

#Preview("ActionSheet - Light") {
    VStack {
        Spacer()
    }
    .actionSheet(isPresented: .constant(true), actions: [
        ActionSheetAction(label: "Share", action: {}),
        ActionSheetAction(label: "Delete", isDestructive: true, action: {})
    ])
    .preferredColorScheme(.light)
}

#Preview("ActionSheet - Dark") {
    VStack {
        Spacer()
    }
    .actionSheet(isPresented: .constant(true), actions: [
        ActionSheetAction(label: "Share", action: {}),
        ActionSheetAction(label: "Delete", isDestructive: true, action: {})
    ])
    .preferredColorScheme(.dark)
}

#Preview("Popover - Light") {
    Text("Tap for info")
        .styledPopover(isPresented: .constant(true)) {
            Text("Additional details go here.")
                .font(UIFontToken.body)
        }
        .padding()
        .preferredColorScheme(.light)
}

#Preview("Popover - Dark") {
    Text("Tap for info")
        .styledPopover(isPresented: .constant(true)) {
            Text("Additional details go here.")
                .font(UIFontToken.body)
        }
        .padding()
        .preferredColorScheme(.dark)
}

#Preview("Tooltip - Light") {
    Image(systemName: "questionmark.circle")
        .tooltip("Long-press to see this tip")
        .padding()
        .preferredColorScheme(.light)
}

#Preview("Tooltip - Dark") {
    Image(systemName: "questionmark.circle")
        .tooltip("Long-press to see this tip")
        .padding()
        .preferredColorScheme(.dark)
}
