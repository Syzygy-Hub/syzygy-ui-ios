import Foundation

/// A single destination shown in `TabBar` or `BottomNavigationBar`.
public struct TabBarItem<Tag: Hashable & Sendable>: Identifiable, Sendable {
    public let id: Tag
    public let tag: Tag
    public let systemImage: String
    public let label: String

    public init(tag: Tag, systemImage: String, label: String) {
        self.tag = tag
        self.id = tag
        self.systemImage = systemImage
        self.label = label
    }
}
