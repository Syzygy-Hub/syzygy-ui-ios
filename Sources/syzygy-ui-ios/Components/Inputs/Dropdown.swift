import SwiftUI

/// A labeled dropdown / picker backed by a `Menu`, selecting from a fixed list of options.
@MainActor
public struct Dropdown<Option: Hashable>: View {
    @Environment(\.syzygyTheme) private var theme

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
        VStack(alignment: .leading, spacing: theme.spacing.xs) {
            Text(label)
                .font(theme.typography.subheadline)
                .foregroundStyle(theme.colors.textSecondary)

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
                        .font(theme.typography.body)
                        .foregroundStyle(theme.colors.textPrimary)

                    Spacer()

                    Image(systemName: "chevron.up.chevron.down")
                        .font(theme.typography.caption)
                        .foregroundStyle(theme.colors.textSecondary)
                }
                .padding(.horizontal, theme.spacing.sm)
                .frame(minHeight: 44)
                .background(theme.colors.surface)
                .overlay(
                    RoundedRectangle(cornerRadius: theme.radius.sm)
                        .stroke(theme.colors.border, lineWidth: 1)
                )
                .clipShape(RoundedRectangle(cornerRadius: theme.radius.sm))
            }
            .accessibilityLabel(label)
        }
    }
}
