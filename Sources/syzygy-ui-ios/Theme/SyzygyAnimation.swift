import SwiftUI

/// Animation duration tokens for injection via SyzygyTheme.
public struct SyzygyAnimationDuration: Equatable, Sendable {
    public let fast: TimeInterval
    public let normal: TimeInterval
    public let slow: TimeInterval

    public init(fast: TimeInterval, normal: TimeInterval, slow: TimeInterval) {
        self.fast = fast; self.normal = normal; self.slow = slow
    }

    /// Matches UIAnimation.Duration: fast=0.15s, normal=0.3s, slow=0.5s.
    public static let `default` = SyzygyAnimationDuration(fast: 0.15, normal: 0.3, slow: 0.5)
}

/// Animation token set for injection via SyzygyTheme.
public struct SyzygyAnimation: Equatable, Sendable {
    public let duration: SyzygyAnimationDuration

    public init(duration: SyzygyAnimationDuration) {
        self.duration = duration
    }

    public static let `default` = SyzygyAnimation(duration: .default)

    // MARK: - Easing helpers (not stored — cannot be Equatable)
    public func standard(_ dur: TimeInterval? = nil) -> Animation {
        .easeInOut(duration: dur ?? duration.normal)
    }

    public func decelerate(_ dur: TimeInterval? = nil) -> Animation {
        .easeOut(duration: dur ?? duration.normal)
    }

    public func accelerate(_ dur: TimeInterval? = nil) -> Animation {
        .easeIn(duration: dur ?? duration.fast)
    }

    public func spring(_ dur: TimeInterval? = nil) -> Animation {
        .spring(response: dur ?? duration.normal, dampingFraction: 0.7)
    }
}
