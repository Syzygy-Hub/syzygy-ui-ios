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
        VStack(alignment: .leading, spacing: UISpacing.xs) {
            Text(label)
                .font(UIFontToken.subheadline)
                .foregroundStyle(UIColorToken.textSecondary)

            HStack(spacing: UISpacing.xxs) {
                if symbolPosition == .prefix {
                    Text(symbol)
                        .foregroundStyle(UIColorToken.textSecondary)
                }

                TextField("0", text: $text)
                    #if os(iOS)
                    .keyboardType(.decimalPad)
                    #endif
                    .foregroundStyle(UIColorToken.textPrimary)
                    .onChange(of: text) { _, newValue in
                        if let parsed = formatter.number(from: newValue)?.doubleValue {
                            value = parsed
                        }
                    }

                if symbolPosition == .suffix {
                    Text(symbol)
                        .foregroundStyle(UIColorToken.textSecondary)
                }
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
        .onAppear {
            text = formatter.string(from: NSNumber(value: value)) ?? ""
        }
    }
}
