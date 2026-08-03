import SwiftUI

/// A tappable field showing a formatted time; tapping reveals a native
/// `DatePicker` (hour/minute) in a popover for selection.
@MainActor
public struct TimePickerField: View {
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
        VStack(alignment: .leading, spacing: UISpacing.xs) {
            Text(label)
                .font(UIFontToken.subheadline)
                .foregroundStyle(UIColorToken.textSecondary)

            Button {
                isPresented = true
            } label: {
                HStack {
                    Text(formatter.string(from: time))
                        .font(UIFontToken.body)
                        .foregroundStyle(UIColorToken.textPrimary)
                    Spacer()
                    Image(systemName: "clock")
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
