// swift-tools-version: 6.3.1

import PackageDescription

let package = Package(
    name: "swift-cyclic-iterator-primitives",
    platforms: [
        .macOS(.v26),
        .iOS(.v26),
        .tvOS(.v26),
        .watchOS(.v26),
        .visionOS(.v26)
    ],
    products: [
        .library(
            name: "Cyclic Iterator Primitives",
            targets: ["Cyclic Iterator Primitives"]
        ),
        .library(
            name: "Cyclic Iterator Primitives Test Support",
            targets: ["Cyclic Iterator Primitives Test Support"]
        ),
    ],
    dependencies: [
        .package(url: "https://github.com/swift-primitives/swift-cyclic-primitives.git", branch: "main"),
        .package(url: "https://github.com/swift-primitives/swift-cardinal-primitives.git", branch: "main"),
        .package(url: "https://github.com/swift-primitives/swift-ordinal-primitives.git", branch: "main"),
        .package(url: "https://github.com/swift-primitives/swift-sequence-primitives.git", branch: "main"),
        .package(url: "https://github.com/swift-primitives/swift-iterator-primitives.git", branch: "main"),
    ],
    targets: [
        .target(
            name: "Cyclic Iterator Primitives",
            dependencies: [
                .product(name: "Cyclic Group Static Element Primitives", package: "swift-cyclic-primitives"),
                .product(name: "Cyclic Group Static Primitives", package: "swift-cyclic-primitives"),
                .product(name: "Cyclic Namespace Primitives", package: "swift-cyclic-primitives"),
                .product(name: "Cardinal Primitives", package: "swift-cardinal-primitives"),
                .product(name: "Ordinal Primitives", package: "swift-ordinal-primitives"),
                .product(name: "Sequence Primitives", package: "swift-sequence-primitives"),
                .product(name: "Iterable", package: "swift-iterator-primitives"),
            ]
        ),
        .target(
            name: "Cyclic Iterator Primitives Test Support",
            dependencies: [
                "Cyclic Iterator Primitives",
            ],
            path: "Tests/Support"
        ),
        .testTarget(
            name: "Cyclic Iterator Primitives Tests",
            dependencies: [
                "Cyclic Iterator Primitives",
                "Cyclic Iterator Primitives Test Support",
            ]
        ),
    ],
    swiftLanguageModes: [.v6]
)

for target in package.targets where ![.system, .binary, .plugin, .macro].contains(target.type) {
    let ecosystem: [SwiftSetting] = [
        .strictMemorySafety(),
        .enableUpcomingFeature("ExistentialAny"),
        .enableUpcomingFeature("InternalImportsByDefault"),
        .enableUpcomingFeature("MemberImportVisibility"),
        .enableUpcomingFeature("NonisolatedNonsendingByDefault"),
        .enableExperimentalFeature("LifetimeDependence"),
        .enableExperimentalFeature("Lifetimes"),
        .enableExperimentalFeature("SuppressedAssociatedTypes"),
        .enableUpcomingFeature("InferIsolatedConformances"),
        .enableUpcomingFeature("LifetimeDependence"),
    ]

    let package: [SwiftSetting] = []

    target.swiftSettings = (target.swiftSettings ?? []) + ecosystem + package
}
