import SwiftUI

/// A numeric field with a currency symbol prefix or suffix (configurable —
/// e.g. USD prefixes "$" while some European locales suffix "€"). The
/// *displayed* text is formatted via `NumberFormatter` with `.numberStyle = .decimal`,
/// using `locale` (default `.current`) for decimal/thousands separators; the
/// raw numeric value is exposed separately as a `Double` via `value`, parsed
/// back from the formatted string (through the same locale-aware `NumberFormatter`)
/// as the user types.
public enum CurrencySymbolPosition {
    case prefix
    case suffix
}

@MainActor
public struct CurrencyInput: View {
    @Environment(\.syzygyTheme) private var theme

    private let label: String
    private let symbol: String
    private let symbolPosition: CurrencySymbolPosition
    private let locale: Locale
    @Binding private var value: Double
    @State private var text: String = ""

    public init(
        label: String,
        value: Binding<Double>,
        symbol: String = "$",
        symbolPosition: CurrencySymbolPosition = .prefix,
        locale: Locale = .current
    ) {
        self.label = label
        self._value = value
        self.symbol = symbol
        self.symbolPosition = symbolPosition
        self.locale = locale
    }

    private var formatter: NumberFormatter {
        let formatter = NumberFormatter()
        formatter.numberStyle = .decimal
        formatter.locale = locale
        formatter.maximumFractionDigits = 2
        return formatter
    }

    public var body: some View {
        VStack(alignment: .leading, spacing: theme.spacing.xs) {
            Text(label)
                .font(theme.typography.subheadline)
                .foregroundStyle(theme.colors.textSecondary)

            HStack(spacing: theme.spacing.xxs) {
                if symbolPosition == .prefix {
                    Text(symbol)
                        .foregroundStyle(theme.colors.textSecondary)
                }

                TextField("0", text: $text)
                    #if os(iOS)
                    .keyboardType(.decimalPad)
                    #endif
                    .foregroundStyle(theme.colors.textPrimary)
                    .onChange(of: text) { _, newValue in
                        if let parsed = formatter.number(from: newValue)?.doubleValue {
                            value = parsed
                        }
                    }

                if symbolPosition == .suffix {
                    Text(symbol)
                        .foregroundStyle(theme.colors.textSecondary)
                }
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
        .onAppear {
            text = formatter.string(from: NSNumber(value: value)) ?? ""
        }
    }
}
