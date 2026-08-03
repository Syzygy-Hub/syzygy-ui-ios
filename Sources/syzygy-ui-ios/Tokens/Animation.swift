import SwiftUI

/// Animation duration and easing tokens used throughout the design system.
public enum UIAnimation {
    /// Standard durations, in seconds.
    public enum Duration {
        public static let fast: TimeInterval = 0.15
        public static let normal: TimeInterval = 0.3
        public static let slow: TimeInterval = 0.5
    }

    /// Easing curves as `Animation` factories, so `Easing.standard(Duration.normal)`
    /// composes a duration and curve together.
    public enum Easing {
        public static func standard(_ duration: TimeInterval = Duration.normal) -> Animation {
            .easeInOut(duration: duration)
        }

        public static func decelerate(_ duration: TimeInterval = Duration.normal) -> Animation {
            .easeOut(duration: duration)
        }

        public static func accelerate(_ duration: TimeInterval = Duration.normal) -> Animation {
            .easeIn(duration: duration)
        }

        public static func spring(_ duration: TimeInterval = Duration.normal) -> Animation {
            .spring(duration: duration)
        }
    }
}
