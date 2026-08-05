import SwiftUI

/// A tappable field showing a formatted date; tapping reveals a native
/// `DatePicker` in a popover for selection.
@MainActor
public struct DatePickerField: View {
    @Environment(\.syzygyTheme) private var theme

    private let label: String
    @Binding private var date: Date
    private let formatter: DateFormatter

    @State private var isPresented = false

    public init(label: String, date: Binding<Date>) {
        self.label = label
        self._date = date
        let formatter = DateFormatter()
        formatter.dateStyle = .medium
        self.formatter = formatter
    }

    public var body: some View {
        VStack(alignment: .leading, spacing: theme.spacing.xs) {
            Text(label)
                .font(theme.typography.subheadline)
                .foregroundStyle(theme.colors.textSecondary)

            Button {
                isPresented = true
            } label: {
                HStack {
                    Text(formatter.string(from: date))
                        .font(theme.typography.body)
                        .foregroundStyle(theme.colors.textPrimary)
                    Spacer()
                    Image(systemName: "calendar")
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
            .popover(isPresented: $isPresented) {
                DatePicker("", selection: $date, displayedComponents: .date)
                    .datePickerStyle(.graphical)
                    .labelsHidden()
                    .padding()
            }
        }
    }
}
