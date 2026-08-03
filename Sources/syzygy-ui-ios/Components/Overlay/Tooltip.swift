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
                        .font(UIFontToken.caption)
                        .foregroundStyle(UIColorToken.textOnPrimary)
                        .padding(.horizontal, UISpacing.sm)
                        .padding(.vertical, UISpacing.xs)
                        .background(UIColorToken.textPrimary)
                        .clipShape(RoundedRectangle(cornerRadius: UIRadius.sm))
                        .offset(y: -36)
                        .transition(.opacity.combined(with: .move(edge: .bottom)))
                        .accessibilityHidden(true)
                }
            }
    }
}
