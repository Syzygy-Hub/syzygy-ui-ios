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
