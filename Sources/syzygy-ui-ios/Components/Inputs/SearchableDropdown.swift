import SwiftUI

/// A dropdown with an inline search field that filters the options list as
/// the user types. Implemented as a **standalone** component rather than a
/// wrapper around `Dropdown`: `Dropdown` is backed by SwiftUI's native `Menu`,
/// which renders its own system-managed list and provides no way to inject a
/// custom filtered/searchable subview into that list — so there's no
/// composition seam to reuse. Instead this mirrors `Dropdown`'s label/trigger
/// styling and token usage, and expands into a token-styled, tappable
/// filtered list of its own rather than a `Menu`.
@MainActor
public struct SearchableDropdown<Option: Hashable>: View {
    @Environment(\.syzygyTheme) private var theme

    private let label: String
    @Binding private var selection: Option
    private let options: [Option]
    private let optionTitle: (Option) -> String

    @State private var isExpanded = false
    @State private var query = ""

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

    private var filteredOptions: [Option] {
        guard !query.isEmpty else { return options }
        return options.filter { optionTitle($0).localizedCaseInsensitiveContains(query) }
    }

    public var body: some View {
        VStack(alignment: .leading, spacing: theme.spacing.xs) {
            Text(label)
                .font(theme.typography.subheadline)
                .foregroundStyle(theme.colors.textSecondary)

            Button {
                withAnimation(UIAnimation.Easing.standard(UIAnimation.Duration.fast)) {
                    isExpanded.toggle()
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
                        .stroke(theme.colors.border, lineWidth: UIBorderWidth.thin)
                )
                .clipShape(RoundedRectangle(cornerRadius: theme.radius.sm))
            }
            .accessibilityLabel(label)

            if isExpanded {
                VStack(alignment: .leading, spacing: theme.spacing.xs) {
                    TextField("Search", text: $query)
                        .padding(.horizontal, theme.spacing.sm)
                        .frame(minHeight: 36)
                        .background(theme.colors.surfaceSecondary)
                        .clipShape(RoundedRectangle(cornerRadius: theme.radius.sm))

                    ScrollView {
                        VStack(alignment: .leading, spacing: 0) {
                            ForEach(filteredOptions, id: \.self) { option in
                                Button {
                                    selection = option
                                    query = ""
                                    withAnimation(UIAnimation.Easing.standard(UIAnimation.Duration.fast)) {
                                        isExpanded = false
                                    }
                                } label: {
                                    HStack {
                                        Text(optionTitle(option))
                                            .foregroundStyle(theme.colors.textPrimary)
                                        Spacer()
                                        if option == selection {
                                            Image(systemName: "checkmark")
                                                .foregroundStyle(theme.colors.primary)
                                        }
                                    }
                                    .padding(.horizontal, theme.spacing.sm)
                                    .frame(minHeight: 40)
                                }
                            }
                        }
                    }
                    .frame(maxHeight: 200)
                }
                .padding(theme.spacing.xs)
                .background(theme.colors.surface)
                .overlay(
                    RoundedRectangle(cornerRadius: theme.radius.sm)
                        .stroke(theme.colors.border, lineWidth: UIBorderWidth.thin)
                )
                .clipShape(RoundedRectangle(cornerRadius: theme.radius.sm))
                .transition(.opacity.combined(with: .move(edge: .top)))
            }
        }
    }
}
