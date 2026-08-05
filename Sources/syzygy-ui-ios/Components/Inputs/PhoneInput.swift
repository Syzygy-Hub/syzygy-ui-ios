import SwiftUI

/// A phone number field with a tappable country-code prefix (flag + dial
/// code) and a numeric keypad. Exposes both a formatted display string
/// (e.g. "(555) 123-4567") via `formattedText` and the raw digits-only
/// number via `digits`, as two separate bindings, so a consumer can submit
/// the raw digits while showing the formatted text.
///
/// `countries` defaults to a small, deliberately minimal starter set of 12
/// real countries with correct flag emoji and dial codes. It is **not**
/// full ISO 3166 coverage — a consumer needing the complete country list
/// should supply their own `[PhoneCountry]` via the `countries` parameter.
public struct PhoneCountry: Identifiable, Hashable, Sendable {
    public var id: String { dialCode + flag }
    public let flag: String
    public let dialCode: String
    public let name: String

    public init(flag: String, dialCode: String, name: String) {
        self.flag = flag
        self.dialCode = dialCode
        self.name = name
    }

    public static let defaultCountries: [PhoneCountry] = [
        PhoneCountry(flag: "🇺🇸", dialCode: "+1", name: "United States"),
        PhoneCountry(flag: "🇨🇦", dialCode: "+1", name: "Canada"),
        PhoneCountry(flag: "🇬🇧", dialCode: "+44", name: "United Kingdom"),
        PhoneCountry(flag: "🇦🇺", dialCode: "+61", name: "Australia"),
        PhoneCountry(flag: "🇩🇪", dialCode: "+49", name: "Germany"),
        PhoneCountry(flag: "🇫🇷", dialCode: "+33", name: "France"),
        PhoneCountry(flag: "🇪🇸", dialCode: "+34", name: "Spain"),
        PhoneCountry(flag: "🇮🇹", dialCode: "+39", name: "Italy"),
        PhoneCountry(flag: "🇯🇵", dialCode: "+81", name: "Japan"),
        PhoneCountry(flag: "🇮🇳", dialCode: "+91", name: "India"),
        PhoneCountry(flag: "🇧🇷", dialCode: "+55", name: "Brazil"),
        PhoneCountry(flag: "🇲🇽", dialCode: "+52", name: "Mexico")
    ]
}

@MainActor
public struct PhoneInput: View {
    @Environment(\.syzygyTheme) private var theme

    private let label: String
    private let countries: [PhoneCountry]
    @Binding private var selectedCountry: PhoneCountry
    @Binding private var digits: String
    @State private var isPickerPresented = false

    public init(
        label: String,
        selectedCountry: Binding<PhoneCountry>,
        digits: Binding<String>,
        countries: [PhoneCountry] = PhoneCountry.defaultCountries
    ) {
        self.label = label
        self._selectedCountry = selectedCountry
        self._digits = digits
        self.countries = countries
    }

    /// A US-style formatted display string derived from `digits`, e.g. "(555) 123-4567".
    /// Consumers targeting other locales' formatting should format `digits` themselves.
    public var formattedText: String {
        let chars = Array(digits.prefix(10))
        switch chars.count {
        case 0: return ""
        case 1...3: return "(\(String(chars))"
        case 4...6: return "(\(String(chars.prefix(3)))) \(String(chars.suffix(chars.count - 3)))"
        default:
            let area = String(chars.prefix(3))
            let exchange = String(chars[3..<6])
            let line = String(chars.suffix(chars.count - 6))
            return "(\(area)) \(exchange) - \(line)"
        }
    }

    public var body: some View {
        VStack(alignment: .leading, spacing: theme.spacing.xs) {
            Text(label)
                .font(theme.typography.subheadline)
                .foregroundStyle(theme.colors.textSecondary)

            HStack(spacing: theme.spacing.sm) {
                Button {
                    isPickerPresented.toggle()
                } label: {
                    Text("\(selectedCountry.flag) \(selectedCountry.dialCode)")
                        .font(theme.typography.body)
                        .foregroundStyle(theme.colors.textPrimary)
                }
                .accessibilityLabel("Country code, \(selectedCountry.name)")

                TextField("(555) 123-4567", text: Binding(
                    get: { formattedText },
                    set: { newValue in digits = String(newValue.filter(\.isNumber).prefix(10)) }
                ))
                #if os(iOS)
                .keyboardType(.numberPad)
                #endif
                .foregroundStyle(theme.colors.textPrimary)
            }
            .padding(.horizontal, theme.spacing.sm)
            .frame(minHeight: 44)
            .background(theme.colors.surface)
            .overlay(
                RoundedRectangle(cornerRadius: theme.radius.sm)
                    .stroke(theme.colors.border, lineWidth: UIBorderWidth.thin)
            )
            .clipShape(RoundedRectangle(cornerRadius: theme.radius.sm))
            .modal(isPresented: $isPickerPresented) {
                VStack(alignment: .leading, spacing: 0) {
                    ForEach(countries) { country in
                        Button {
                            selectedCountry = country
                            isPickerPresented = false
                        } label: {
                            Text("\(country.flag) \(country.dialCode)  \(country.name)")
                                .foregroundStyle(theme.colors.textPrimary)
                                .frame(maxWidth: .infinity, alignment: .leading)
                        }
                        .padding(.vertical, theme.spacing.xs)
                    }
                }
            }
        }
    }
}
