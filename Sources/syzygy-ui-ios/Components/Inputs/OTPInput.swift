import SwiftUI

/// A row of fixed-width single-character boxes for OTP/PIN entry. Focus
/// auto-advances to the next box as each character is entered.
@MainActor
public struct OTPInput: View {
    private let length: Int
    @Binding private var code: String
    @FocusState private var focusedIndex: Int?

    public init(length: Int = 6, code: Binding<String>) {
        self.length = length
        self._code = code
    }

    public var body: some View {
        HStack(spacing: UISpacing.sm) {
            ForEach(0..<length, id: \.self) { index in
                TextField("", text: characterBinding(for: index))
                    #if os(iOS)
                    .keyboardType(.numberPad)
                    #endif
                    .multilineTextAlignment(.center)
                    .font(UIFontToken.title)
                    .foregroundStyle(UIColorToken.textPrimary)
                    .frame(width: 44, height: 52)
                    .background(UIColorToken.surface)
                    .overlay(
                        RoundedRectangle(cornerRadius: UIRadius.sm)
                            .stroke(
                                focusedIndex == index ? UIColorToken.focus : UIColorToken.border,
                                lineWidth: focusedIndex == index ? UIBorderWidth.thick : UIBorderWidth.thin
                            )
                    )
                    .clipShape(RoundedRectangle(cornerRadius: UIRadius.sm))
                    .focused($focusedIndex, equals: index)
                    .accessibilityLabel("Digit \(index + 1) of \(length)")
            }
        }
        .onAppear {
            if focusedIndex == nil {
                focusedIndex = 0
            }
        }
    }

    private func characterBinding(for index: Int) -> Binding<String> {
        Binding(
            get: {
                let chars = Array(code)
                return index < chars.count ? String(chars[index]) : ""
            },
            set: { newValue in
                var chars = Array(code)
                while chars.count < length { chars.append(" ") }

                if let last = newValue.last {
                    chars[index] = last
                    if index + 1 < length {
                        focusedIndex = index + 1
                    } else {
                        focusedIndex = nil
                    }
                } else {
                    chars[index] = " "
                    if index > 0 {
                        focusedIndex = index - 1
                    }
                }

                code = String(chars.prefix(length)).replacingOccurrences(of: " ", with: "")
            }
        )
    }
}
