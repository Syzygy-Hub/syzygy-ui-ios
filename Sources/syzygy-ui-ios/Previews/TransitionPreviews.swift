import SwiftUI

private struct SlideTransitionPreview: View {
    @State private var isShowing = true

    var body: some View {
        VStack {
            Button("Toggle") {
                withAnimation { isShowing.toggle() }
            }
            if isShowing {
                CardView { Text("Slides left \u{2192} right") }
                    .transition(.slideTransition(.leftToRight))
            }
        }
        .padding()
    }
}

private struct CrossFadeTransitionPreview: View {
    @State private var isShowing = true

    var body: some View {
        VStack {
            Button("Toggle") {
                withAnimation { isShowing.toggle() }
            }
            if isShowing {
                CardView { Text("Cross-fades") }
                    .transition(.crossFadeTransition)
            }
        }
        .padding()
    }
}

private struct SlideVerticalTransitionPreview: View {
    @State private var isShowing = true

    var body: some View {
        VStack {
            Button("Toggle") {
                withAnimation { isShowing.toggle() }
            }
            if isShowing {
                CardView { Text("Slides top \u{2192} bottom") }
                    .transition(.slideVerticalTransition(.topToBottom))
            }
        }
        .padding()
    }
}

private struct ModalPresentationTransitionPreview: View {
    @State private var isShowing = true

    var body: some View {
        VStack {
            Button("Toggle") {
                withAnimation { isShowing.toggle() }
            }
            if isShowing {
                CardView { Text("Slides up + fades") }
                    .transition(.modalPresentationTransition)
            }
        }
        .padding()
    }
}

#Preview("SlideTransition - Light") {
    SlideTransitionPreview()
        .preferredColorScheme(.light)
}

#Preview("CrossFadeTransition - Light") {
    CrossFadeTransitionPreview()
        .preferredColorScheme(.light)
}

#Preview("SlideVerticalTransition - Light") {
    SlideVerticalTransitionPreview()
        .preferredColorScheme(.light)
}

#Preview("ModalPresentationTransition - Light") {
    ModalPresentationTransitionPreview()
        .preferredColorScheme(.light)
}

private struct ScaleTransitionPreview: View {
    @State private var isShowing = true

    var body: some View {
        VStack {
            Button("Toggle") {
                withAnimation { isShowing.toggle() }
            }
            if isShowing {
                CardView { Text("Scales in \u{2194} out") }
                    .transition(.scaleTransition)
            }
        }
        .padding()
    }
}

private struct FadeThroughTransitionPreview: View {
    @State private var isShowing = true

    var body: some View {
        VStack {
            Button("Toggle") {
                withAnimation { isShowing.toggle() }
            }
            if isShowing {
                CardView { Text("Fades through") }
                    .transition(.fadeThroughTransition)
            }
        }
        .padding()
    }
}

#Preview("ScaleTransition - Light") {
    ScaleTransitionPreview()
        .preferredColorScheme(.light)
}

#Preview("FadeThroughTransition - Light") {
    FadeThroughTransitionPreview()
        .preferredColorScheme(.light)
}
