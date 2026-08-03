import SwiftUI

/// A bottom-anchored temporary message view with an optional action button,
/// auto-dismissing after `duration`. Consumers conditionally show this
/// themselves (e.g. via `.overlay(alignment: .bottom)`) rather than relying
/// on a global overlay-manager singleton, matching this library's
/// no-hidden-global-state pattern.
@MainActor
public struct Snackbar: View {
    private let message: String
    private let actionLabel: String?
    private let onAction: (() -> Void)?
    @Binding private var isPresented: Bool
    private let duration: TimeInterval

    public init(
        message: String,
        actionLabel: String? = nil,
        onAction: (() -> Void)? = nil,
        isPresented: Binding<Bool>,
        duration: TimeInterval = 3.0
    ) {
        self.message = message
        self.actionLabel = actionLabel
        self.onAction = onAction
        self._isPresented = isPresented
        self.duration = duration
    }

    public var body: some View {
        Group {
            if isPresented {
                HStack(spacing: UISpacing.md) {
                    Text(message)
                        .font(UIFontToken.subheadline)
                        .foregroundStyle(UIColorToken.textOnPrimary)

                    Spacer()

                    if let actionLabel {
                        Button(actionLabel) {
                            onAction?()
                            isPresented = false
                        }
                        .font(UIFontToken.subheadline.weight(.semibold))
                        .foregroundStyle(UIColorToken.textOnPrimary)
                    }
                }
                .padding(.horizontal, UISpacing.md)
                .frame(minHeight: 44)
                .background(UIColorToken.textPrimary)
                .clipShape(RoundedRectangle(cornerRadius: UIRadius.md))
                .padding(.horizontal, UISpacing.md)
                .padding(.bottom, UISpacing.md)
                .transition(.move(edge: .bottom).combined(with: .opacity))
                .task(id: isPresented) {
                    guard isPresented else { return }
                    try? await Task.sleep(nanoseconds: UInt64(duration * 1_000_000_000))
                    if !Task.isCancelled {
                        isPresented = false
                    }
                }
                .accessibilityElement(children: .combine)
                .accessibilityLabel(message)
            }
        }
        .animation(UIAnimation.Easing.standard(), value: isPresented)
    }
}
