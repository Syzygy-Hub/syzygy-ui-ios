// swift-tools-version: 6.0
import PackageDescription

let package = Package(
    name: "syzygy-ui-ios",
    platforms: [
        .iOS(.v17),
        .macOS(.v14)
    ],
    products: [
        .library(
            name: "syzygy-ui-ios",
            targets: ["syzygy-ui-ios"]
        ),
    ],
    dependencies: [
        .package(url: "https://github.com/Syzygy-Hub/syzygy-foundation-ios", from: "3.0.0"),
    ],
    targets: [
        .target(
            name: "syzygy-ui-ios",
            dependencies: [
                .product(name: "SyzygyFoundation", package: "syzygy-foundation-ios"),
            ]
        ),
        .testTarget(
            name: "syzygy-ui-iosTests",
            dependencies: ["syzygy-ui-ios"]
        ),
    ],
    swiftLanguageModes: [.v6]
)
