import SwiftUI

/// A themed, opinionated confirm/cancel dialog preset built on top of the
/// existing `ModalDialog` primitive (mirroring how v2.1.0's `ActionSheet` was
/// built on top of `BottomSheet`), rather than reimplementing modal
/// presentation from scratch. `isDestructive` styles the confirm button
/// using the `destructive` color token.
@MainActor
private struct ConfirmDialogContent: View {
    @Environment(\.syzygyTheme) private var theme

    let title: String
    let message: String
    let confirmLabel: String
    let cancelLabel: String
    let isDestructive: Bool
    let onConfirm: () -> Void
    let onCancel: () -> Void

    var body: some View {
        VStack(spacing: theme.spacing.md) {
            Text(title)
                .font(theme.typography.headline)
                .foregroundStyle(theme.colors.textPrimary)

            Text(message)
                .font(theme.typography.subheadline)
                .foregroundStyle(theme.colors.textSecondary)
                .multilineTextAlignment(.center)

            HStack(spacing: theme.spacing.sm) {
                Button(cancelLabel, action: onCancel)
                    .font(theme.typography.body)
                    .foregroundStyle(theme.colors.textSecondary)
                    .frame(maxWidth: .infinity, minHeight: 44)

                Button(confirmLabel, action: onConfirm)
                    .font(theme.typography.body.weight(.semibold))
                    .foregroundStyle(isDestructive ? theme.colors.destructive : theme.colors.primary)
                    .frame(maxWidth: .infinity, minHeight: 44)
            }
        }
    }
}

/// Presents a `ConfirmDialog` above the current view when `isPresented` is
/// true, following the same `.xxx(isPresented:)` convention as `.modal(isPresented:)`.
public extension View {
    @MainActor
    func confirmDialog(
        isPresented: Binding<Bool>,
        title: String,
        message: String,
        confirmLabel: String = "Confirm",
        cancelLabel: String = "Cancel",
        isDestructive: Bool = false,
        onConfirm: @escaping () -> Void
    ) -> some View {
        self.modal(isPresented: isPresented) {
            ConfirmDialogContent(
                title: title,
                message: message,
                confirmLabel: confirmLabel,
                cancelLabel: cancelLabel,
                isDestructive: isDestructive,
                onConfirm: {
                    isPresented.wrappedValue = false
                    onConfirm()
                },
                onCancel: {
                    isPresented.wrappedValue = false
                }
            )
        }
    }
}
