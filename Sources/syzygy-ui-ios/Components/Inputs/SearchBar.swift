import SwiftUI

/// A search field with a leading icon, trailing clear button, and built-in debounce.
@MainActor
public struct SearchBar: View {
    @Binding private var text: String
    private let placeholder: String
    private let debounceInterval: Duration
    private let onSearchTextChanged: ((String) -> Void)?

    @State private var debounceTask: Task<Void, Never>?

    public init(
        text: Binding<String>,
        placeholder: String = "Search",
        debounceInterval: Duration = .milliseconds(300),
        onSearchTextChanged: ((String) -> Void)? = nil
    ) {
        self._text = text
        self.placeholder = placeholder
        self.debounceInterval = debounceInterval
        self.onSearchTextChanged = onSearchTextChanged
    }

    public var body: some View {
        HStack(spacing: UISpacing.sm) {
            Image(systemName: "magnifyingglass")
                .foregroundStyle(UIColorToken.textSecondary)

            TextField(placeholder, text: $text)
                .font(UIFontToken.body)
                .foregroundStyle(UIColorToken.textPrimary)
                .onChange(of: text) { _, newValue in
                    scheduleDebounce(with: newValue)
                }

            if !text.isEmpty {
                Button {
                    text = ""
                    debounceTask?.cancel()
                    onSearchTextChanged?("")
                } label: {
                    Image(systemName: "xmark.circle.fill")
                        .foregroundStyle(UIColorToken.textSecondary)
                        .frame(width: 44, height: 44)
                }
                .accessibilityLabel("Clear search")
            }
        }
        .padding(.leading, UISpacing.sm)
        .frame(minHeight: 44)
        .background(UIColorToken.surface)
        .overlay(
            RoundedRectangle(cornerRadius: UIRadius.sm)
                .stroke(UIColorToken.border, lineWidth: 1)
        )
        .clipShape(RoundedRectangle(cornerRadius: UIRadius.sm))
        .accessibilityLabel(placeholder)
    }

    private func scheduleDebounce(with value: String) {
        debounceTask?.cancel()
        guard let onSearchTextChanged else { return }
        debounceTask = Task {
            try? await Task.sleep(for: debounceInterval)
            guard !Task.isCancelled else { return }
            onSearchTextChanged(value)
        }
    }
}
