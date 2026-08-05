import SwiftUI

/// A small floating label revealed near its anchor on long-press. iOS touch
/// devices have no hover, so this uses `.onLongPressGesture`; on macOS it
/// also reveals on hover.
public extension View {
    @MainActor
    func tooltip(_ text: String) -> some View {
        modifier(TooltipModifier(text: text))
    }
}

@MainActor
private struct TooltipModifier: ViewModifier {
    @Environment(\.syzygyTheme) private var theme

    let text: String
    @State private var isVisible = false

    func body(content: Content) -> some View {
        content
            .onLongPressGesture(minimumDuration: 0.4) {
                withAnimation(UIAnimation.Easing.decelerate()) {
                    isVisible = true
                }
                Task {
                    try? await Task.sleep(nanoseconds: UInt64(UIAnimation.Duration.slow * 3 * 1_000_000_000))
                    withAnimation(UIAnimation.Easing.standard()) {
                        isVisible = false
                    }
                }
            }
            #if os(macOS)
            .onHover { hovering in
                withAnimation(UIAnimation.Easing.standard()) {
                    isVisible = hovering
                }
            }
            #endif
            .overlay(alignment: .top) {
                if isVisible {
                    Text(text)
                        .font(theme.typography.caption)
                        .foregroundStyle(theme.colors.onPrimary)
                        .padding(.horizontal, theme.spacing.sm)
                        .padding(.vertical, theme.spacing.xs)
                        .background(theme.colors.textPrimary)
                        .clipShape(RoundedRectangle(cornerRadius: theme.radius.sm))
                        .offset(y: -36)
                        .transition(.opacity.combined(with: .move(edge: .bottom)))
                        .accessibilityHidden(true)
                }
            }
    }
}
