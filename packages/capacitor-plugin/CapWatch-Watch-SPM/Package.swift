// swift-tools-version: 5.7

import PackageDescription

let package = Package(
    name: "iOS-capWatch-watch",
    platforms: [.iOS(.v16), .watchOS(.v9)],
    products: [
        .library(
            name: "iOS-capWatch-watch",
            targets: ["iOS-capWatch-watch"]),
    ],
    dependencies: [
    ],
    targets: [
        .target(
            name: "iOS-capWatch-watch",
            dependencies: []),
        .testTarget(
            name: "iOS-capWatch-watchTests",
            dependencies: ["iOS-capWatch-watch"]),
    ]
)
