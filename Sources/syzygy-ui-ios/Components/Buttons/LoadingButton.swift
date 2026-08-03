import SwiftUI

/// A filled call-to-action button with a built-in loading spinner state.
/// While `isLoading` is true, the label is replaced by a `ProgressView` and
/// the button is disabled.
@MainActor
public struct LoadingButton: View {
    private let label: String
    private let isLoading: Bool
    private let action: () -> Void

    public init(label: String, isLoading: Bool, action: @escaping () -> Void) {
        self.label = label
        self.isLoading = isLoading
        self.action = action
    }

    public var body: some View {
        Button(action: action) {
            ZStack {
                Text(label)
                    .font(UIFontToken.headline)
                    .opacity(isLoading ? 0 : 1)

                if isLoading {
                    ProgressView()
                        .tint(UIColorToken.textOnPrimary)
                }
            }
            .foregroundStyle(UIColorToken.textOnPrimary)
            .frame(maxWidth: .infinity, minHeight: 44)
            .padding(.horizontal, UISpacing.md)
        }
        .background(UIColorToken.primary.opacity(isLoading ? UIOpacity.disabled : 1))
        .clipShape(RoundedRectangle(cornerRadius: UIRadius.md))
        .disabled(isLoading)
        .accessibilityLabel(label)
        .accessibilityAddTraits(isLoading ? [] : [.isButton])
    }
}
