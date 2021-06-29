// swift-tools-version:5.3
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "Queue",
    platforms: [
        .macOS(.v10_12),
        .iOS(.v10),
        .tvOS(.v10),
        .watchOS(.v3),
    ],
    products: [
        .library(
            name: "Queue",
            targets: [
                "Queue"
            ]),
    ],
    targets: [
        .target(
            name: "Queue",
            dependencies: [
            ]),
        .testTarget(
            name: "QueueTests",
            dependencies: [
                "Queue"
            ]),
    ],
    swiftLanguageVersions: [
        .v5,
    ]
)
