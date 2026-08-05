import SwiftUI

/// A tappable field showing a formatted time; tapping reveals a native
/// `DatePicker` (hour/minute) in a popover for selection.
@MainActor
public struct TimePickerField: View {
    @Environment(\.syzygyTheme) private var theme

    private let label: String
    @Binding private var time: Date
    private let formatter: DateFormatter

    @State private var isPresented = false

    public init(label: String, time: Binding<Date>) {
        self.label = label
        self._time = time
        let formatter = DateFormatter()
        formatter.timeStyle = .short
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
                    Text(formatter.string(from: time))
                        .font(theme.typography.body)
                        .foregroundStyle(theme.colors.textPrimary)
                    Spacer()
                    Image(systemName: "clock")
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
                DatePicker("", selection: $time, displayedComponents: .hourAndMinute)
                    #if os(iOS)
                    .datePickerStyle(.wheel)
                    #endif
                    .labelsHidden()
                    .padding()
            }
        }
    }
}
