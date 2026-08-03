import SwiftUI

/// Reusable `AnyTransition` helpers for common navigation/presentation motion.
/// Apply with `.transition(...)` inside a `withAnimation` block, same as any
/// other SwiftUI transition.
public extension AnyTransition {
    enum HorizontalSlideDirection {
        case leftToRight
        case rightToLeft
    }

    /// Slides a view in/out horizontally. `.leftToRight` inserts from the
    /// leading edge and removes toward the trailing edge; `.rightToLeft` is
    /// the reverse.
    static func slideTransition(_ direction: HorizontalSlideDirection) -> AnyTransition {
        switch direction {
        case .leftToRight:
            .asymmetric(
                insertion: .move(edge: .leading),
                removal: .move(edge: .trailing)
            )
        case .rightToLeft:
            .asymmetric(
                insertion: .move(edge: .trailing),
                removal: .move(edge: .leading)
            )
        }
    }

    /// A plain cross-fade between the outgoing and incoming view.
    static var crossFadeTransition: AnyTransition {
        .opacity
    }

    enum VerticalSlideDirection {
        case topToBottom
        case bottomToTop
    }

    /// Slides a view in/out vertically. `.topToBottom` inserts from the top
    /// edge and removes toward the bottom edge; `.bottomToTop` is the reverse.
    static func slideVerticalTransition(_ direction: VerticalSlideDirection) -> AnyTransition {
        switch direction {
        case .topToBottom:
            .asymmetric(
                insertion: .move(edge: .top),
                removal: .move(edge: .bottom)
            )
        case .bottomToTop:
            .asymmetric(
                insertion: .move(edge: .bottom),
                removal: .move(edge: .top)
            )
        }
    }

    /// A slide-up-and-fade transition suited to modal/sheet presentation,
    /// used by `ModalView`/`BottomSheet`'s presentation modifiers.
    static var modalPresentationTransition: AnyTransition {
        .move(edge: .bottom).combined(with: .opacity)
    }

    /// A scale-in/out transition combined with opacity for a smoother effect.
    static var scaleTransition: AnyTransition {
        .scale(scale: 0.9).combined(with: .opacity)
    }

    /// A fade-through transition: the outgoing view fades out first, then
    /// the incoming view fades in — sequential, not a simultaneous cross-fade.
    static var fadeThroughTransition: AnyTransition {
        .asymmetric(
            insertion: .opacity.animation(
                UIAnimation.Easing.standard(UIAnimation.Duration.fast).delay(UIAnimation.Duration.fast)
            ),
            removal: .opacity.animation(UIAnimation.Easing.standard(UIAnimation.Duration.fast))
        )
    }
}
