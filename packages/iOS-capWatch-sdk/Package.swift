// swift-tools-version: 5.7
import PackageDescription

let package = Package(
    name: "CapWatch",
    platforms: [.iOS(.v16), .watchOS(.v9)],
    products: [
        .library(
            name: "CapWatch",
            targets: ["CapWatch"]),
    ],
    dependencies: [
    ],
    targets: [
        .target(
            name: "CapWatch",
            dependencies: []),
        .testTarget(
            name: "iOS-capWatch-sdkTests",
            dependencies: ["CapWatch"]),
    ]
)
