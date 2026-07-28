// swift-tools-version: 6.3
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "ios-ui-library",
    platforms: [
        .iOS(.v17),
        .macOS(.v14)
    ],
    products: [
        // Products define the executables and libraries a package produces, making them visible to other packages.
        .library(
            name: "ios-ui-library",
            targets: ["ios-ui-library"]
        ),
    ],
    targets: [
        // Targets are the basic building blocks of a package, defining a module or a test suite.
        // Targets can depend on other targets in this package and products from dependencies.
        .target(
            name: "ios-ui-library"
        ),
        .testTarget(
            name: "ios-ui-libraryTests",
            dependencies: ["ios-ui-library"]
        ),
    ],
    swiftLanguageModes: [.v6]
)
