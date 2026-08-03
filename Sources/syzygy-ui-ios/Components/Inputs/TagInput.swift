import SwiftUI

/// A MultiSelect-style text input: type and submit to add a tag, rendered
/// as a `Chip` you can dismiss to remove it.
@MainActor
public struct TagInput: View {
    @Binding private var tags: [String]
    private let placeholder: String
    private let onAdd: ((String) -> Void)?
    private let onRemove: ((String) -> Void)?

    @State private var draft: String = ""

    public init(
        tags: Binding<[String]>,
        placeholder: String = "Add a tag",
        onAdd: ((String) -> Void)? = nil,
        onRemove: ((String) -> Void)? = nil
    ) {
        self._tags = tags
        self.placeholder = placeholder
        self.onAdd = onAdd
        self.onRemove = onRemove
    }

    public var body: some View {
        VStack(alignment: .leading, spacing: UISpacing.sm) {
            if !tags.isEmpty {
                FlowLayout(spacing: UISpacing.xs) {
                    ForEach(tags, id: \.self) { tag in
                        Chip(tag, onRemove: { remove(tag) })
                    }
                }
            }

            TextField(placeholder, text: $draft)
                .font(UIFontToken.body)
                .foregroundStyle(UIColorToken.textPrimary)
                .padding(.horizontal, UISpacing.sm)
                .frame(minHeight: 44)
                .background(UIColorToken.surface)
                .overlay(
                    RoundedRectangle(cornerRadius: UIRadius.sm)
                        .stroke(UIColorToken.border, lineWidth: UIBorderWidth.thin)
                )
                .clipShape(RoundedRectangle(cornerRadius: UIRadius.sm))
                .onSubmit(commitDraft)
        }
    }

    private func commitDraft() {
        let trimmed = draft.trimmingCharacters(in: .whitespacesAndNewlines)
        guard !trimmed.isEmpty, !tags.contains(trimmed) else { return }
        tags.append(trimmed)
        onAdd?(trimmed)
        draft = ""
    }

    private func remove(_ tag: String) {
        tags.removeAll { $0 == tag }
        onRemove?(tag)
    }
}
