import SwiftUI

/// A bottom-anchored sheet listing labelled actions, built on `BottomSheet`.
@MainActor
public struct ActionSheetAction: Identifiable {
    public let id = UUID()
    public let label: String
    public let isDestructive: Bool
    public let action: () -> Void

    public init(label: String, isDestructive: Bool = false, action: @escaping () -> Void) {
        self.label = label
        self.isDestructive = isDestructive
        self.action = action
    }
}

@MainActor
private struct ActionSheetContent: View {
    @Environment(\.syzygyTheme) private var theme

    let actions: [ActionSheetAction]
    let dismiss: () -> Void

    var body: some View {
        VStack(spacing: 0) {
            ForEach(actions) { action in
                Button {
                    action.action()
                    dismiss()
                } label: {
                    Text(action.label)
                        .font(theme.typography.body)
                        .foregroundStyle(action.isDestructive ? theme.colors.destructive : theme.colors.textPrimary)
                        .frame(maxWidth: .infinity, minHeight: 52)
                }
                .accessibilityLabel(action.label)
                .accessibilityAddTraits(.isButton)

                if action.id != actions.last?.id {
                    DividerLine()
                }
            }
        }
        .padding(.bottom, theme.spacing.md)
    }
}

/// Presents a bottom `ActionSheet` listing `actions`, following the same
/// `.xxx(isPresented:)` convention as `.bottomSheet(isPresented:)`.
public extension View {
    @MainActor
    func actionSheet(isPresented: Binding<Bool>, actions: [ActionSheetAction]) -> some View {
        self.bottomSheet(isPresented: isPresented) {
            ActionSheetContent(actions: actions) {
                isPresented.wrappedValue = false
            }
        }
    }
}
