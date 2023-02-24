// swift-tools-version: 5.7
import PackageDescription

let package = Package(
    name: "iOS-capWatch-sdk",
    platforms: [.iOS(.v16), .watchOS(.v9)],
    products: [
        .library(
            name: "iOS-capWatch-sdk",
            targets: ["iOS-capWatch-sdk"]),
    ],
    dependencies: [
    ],
    targets: [
        .target(
            name: "iOS-capWatch-sdk",
            dependencies: []),
        .testTarget(
            name: "iOS-capWatch-sdkTests",
            dependencies: ["iOS-capWatch-sdk"]),
    ]
)
