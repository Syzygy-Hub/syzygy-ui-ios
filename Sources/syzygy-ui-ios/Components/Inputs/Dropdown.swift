import SwiftUI

/// A labeled dropdown / picker backed by a `Menu`, selecting from a fixed list of options.
@MainActor
public struct Dropdown<Option: Hashable>: View {
    private let label: String
    @Binding private var selection: Option
    private let options: [Option]
    private let optionTitle: (Option) -> String

    public init(
        label: String,
        selection: Binding<Option>,
        options: [Option],
        optionTitle: @escaping (Option) -> String
    ) {
        self.label = label
        self._selection = selection
        self.options = options
        self.optionTitle = optionTitle
    }

    public var body: some View {
        VStack(alignment: .leading, spacing: UISpacing.xs) {
            Text(label)
                .font(UIFontToken.subheadline)
                .foregroundStyle(UIColorToken.textSecondary)

            Menu {
                ForEach(options, id: \.self) { option in
                    Button {
                        selection = option
                    } label: {
                        if option == selection {
                            Label(optionTitle(option), systemImage: "checkmark")
                        } else {
                            Text(optionTitle(option))
                        }
                    }
                }
            } label: {
                HStack {
                    Text(optionTitle(selection))
                        .font(UIFontToken.body)
                        .foregroundStyle(UIColorToken.textPrimary)

                    Spacer()

                    Image(systemName: "chevron.up.chevron.down")
                        .font(UIFontToken.caption)
                        .foregroundStyle(UIColorToken.textSecondary)
                }
                .padding(.horizontal, UISpacing.sm)
                .frame(minHeight: 44)
                .background(UIColorToken.surface)
                .overlay(
                    RoundedRectangle(cornerRadius: UIRadius.sm)
                        .stroke(UIColorToken.border, lineWidth: 1)
                )
                .clipShape(RoundedRectangle(cornerRadius: UIRadius.sm))
            }
            .accessibilityLabel(label)
        }
    }
}
