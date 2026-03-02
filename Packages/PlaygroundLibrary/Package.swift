// swift-tools-version: 6.2

import PackageDescription

let package = Package(
    name: "PlaygroundLibrary",
    products: [
        .library(
            name: "PlaygroundLibrary",
            targets: ["PlaygroundLibrary"]
        ),
    ],
    targets: [
        .target(
            name: "PlaygroundLibrary"
        ),
        .testTarget(
            name: "PlaygroundLibraryTests",
            dependencies: ["PlaygroundLibrary"]
        ),
    ]
)
