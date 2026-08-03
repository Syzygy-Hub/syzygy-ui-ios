import SwiftUI

/// A segmented strength bar plus label for a password, computed from a
/// simple length + character-class-variety heuristic (not cryptographically
/// rigorous, just a reasonable real-time signal for users).
@MainActor
public struct PasswordStrengthIndicator: View {
    public enum Strength: Int, CaseIterable {
        case weak = 1
        case fair = 2
        case strong = 3
        case veryStrong = 4

        var label: String {
            switch self {
            case .weak: "Weak"
            case .fair: "Fair"
            case .strong: "Strong"
            case .veryStrong: "Very Strong"
            }
        }

        var color: Color {
            switch self {
            case .weak: UIColorToken.destructive
            case .fair: UIColorToken.warning
            case .strong: UIColorToken.success
            case .veryStrong: UIColorToken.success
            }
        }
    }

    private let password: String

    public init(password: String) {
        self.password = password
    }

    public var strength: Strength {
        guard !password.isEmpty else { return .weak }

        var score = 0
        if password.count >= 8 { score += 1 }
        if password.count >= 12 { score += 1 }
        if password.rangeOfCharacter(from: .uppercaseLetters) != nil { score += 1 }
        if password.rangeOfCharacter(from: .lowercaseLetters) != nil { score += 1 }
        if password.rangeOfCharacter(from: .decimalDigits) != nil { score += 1 }
        if password.rangeOfCharacter(from: CharacterSet.alphanumerics.inverted) != nil { score += 1 }

        switch score {
        case 0...1: return .weak
        case 2...3: return .fair
        case 4...5: return .strong
        default: return .veryStrong
        }
    }

    public var body: some View {
        VStack(alignment: .leading, spacing: UISpacing.xs) {
            HStack(spacing: UISpacing.xxs) {
                ForEach(Strength.allCases, id: \.rawValue) { segment in
                    RoundedRectangle(cornerRadius: UIRadius.xs)
                        .fill(segment.rawValue <= strength.rawValue ? strength.color : UIColorToken.surfaceTertiary)
                        .frame(height: 4)
                }
            }

            Text(strength.label)
                .font(UIFontToken.caption)
                .foregroundStyle(strength.color)
        }
        .accessibilityElement(children: .combine)
        .accessibilityLabel("Password strength: \(strength.label)")
    }
}
