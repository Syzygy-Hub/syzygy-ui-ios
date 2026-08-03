import SwiftUI

/// A managed group of expandable/collapsible sections, mirroring
/// `CollapsibleView`'s header/disclosure animation but coordinated so that,
/// by default, opening one section closes the others. Pass `allowsMultipleOpen: true`
/// to let sections stay open independently. `CollapsibleView` itself owns its
/// expanded state internally and has no way for a parent to close it from the
/// outside, so `Accordion` reimplements the same header/chevron/animation
/// look with externally-tracked indices instead of wrapping `CollapsibleView` directly.
@MainActor
public struct AccordionSection: Identifiable {
    public let id: String
    public let title: String
    public let content: AnyView

    public init<Content: View>(id: String, title: String, @ViewBuilder content: () -> Content) {
        self.id = id
        self.title = title
        self.content = AnyView(content())
    }
}

@MainActor
public struct Accordion: View {
    private let sections: [AccordionSection]
    private let allowsMultipleOpen: Bool

    @State private var expandedIDs: Set<String>

    public init(
        sections: [AccordionSection],
        allowsMultipleOpen: Bool = false,
        initiallyExpanded: Set<String> = []
    ) {
        self.sections = sections
        self.allowsMultipleOpen = allowsMultipleOpen
        self._expandedIDs = State(initialValue: initiallyExpanded)
    }

    public var body: some View {
        VStack(spacing: UISpacing.sm) {
            ForEach(sections) { section in
                sectionView(section)
            }
        }
    }

    private func sectionView(_ section: AccordionSection) -> some View {
        let isExpanded = expandedIDs.contains(section.id)

        return VStack(alignment: .leading, spacing: 0) {
            Button {
                withAnimation(UIAnimation.Easing.standard()) {
                    toggle(section.id)
                }
            } label: {
                HStack {
                    Text(section.title)
                        .font(UIFontToken.headline)
                        .foregroundStyle(UIColorToken.textPrimary)

                    Spacer()

                    Image(systemName: "chevron.down")
                        .foregroundStyle(UIColorToken.textSecondary)
                        .rotationEffect(.degrees(isExpanded ? 180 : 0))
                }
                .padding(.horizontal, UISpacing.md)
                .frame(minHeight: 44)
            }
            .accessibilityLabel(section.title)
            .accessibilityAddTraits(.isButton)
            .accessibilityValue(isExpanded ? "Expanded" : "Collapsed")

            if isExpanded {
                section.content
                    .padding(.horizontal, UISpacing.md)
                    .padding(.bottom, UISpacing.md)
                    .transition(.opacity.combined(with: .move(edge: .top)))
            }
        }
        .background(UIColorToken.surface)
        .clipShape(RoundedRectangle(cornerRadius: UIRadius.md))
    }

    private func toggle(_ id: String) {
        if expandedIDs.contains(id) {
            expandedIDs.remove(id)
        } else if allowsMultipleOpen {
            expandedIDs.insert(id)
        } else {
            expandedIDs = [id]
        }
    }
}
