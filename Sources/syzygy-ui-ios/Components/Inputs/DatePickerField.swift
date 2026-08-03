import SwiftUI

/// A tappable field showing a formatted date; tapping reveals a native
/// `DatePicker` in a popover for selection.
@MainActor
public struct DatePickerField: View {
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
        VStack(alignment: .leading, spacing: UISpacing.xs) {
            Text(label)
                .font(UIFontToken.subheadline)
                .foregroundStyle(UIColorToken.textSecondary)

            Button {
                isPresented = true
            } label: {
                HStack {
                    Text(formatter.string(from: date))
                        .font(UIFontToken.body)
                        .foregroundStyle(UIColorToken.textPrimary)
                    Spacer()
                    Image(systemName: "calendar")
                        .foregroundStyle(UIColorToken.textSecondary)
                }
                .padding(.horizontal, UISpacing.sm)
                .frame(minHeight: 44)
                .background(UIColorToken.surface)
                .overlay(
                    RoundedRectangle(cornerRadius: UIRadius.sm)
                        .stroke(UIColorToken.border, lineWidth: UIBorderWidth.thin)
                )
                .clipShape(RoundedRectangle(cornerRadius: UIRadius.sm))
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
