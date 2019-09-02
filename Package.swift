// swift-tools-version:4.0
import PackageDescription

let package = Package(
    name: "VaporSoyTestApp",
    dependencies: [
        // 💧 A server-side Swift web framework.
        .package(url: "https://github.com/vapor/vapor.git", from: "3.0.0"),

        .package(url: "https://github.com/vapor/leaf.git", from: "3.0.0"),

        .package(url: "https://github.com/segabor/SoyKit.git", .branch("master"))
    ],
    targets: [
        .target(name: "App", dependencies: ["Leaf", "Vapor", "SoyKit"], exclude: ["Config", "Database", "Public", "Resources"]),
        .target(name: "Run", dependencies: ["App"]),
        .testTarget(name: "AppTests", dependencies: ["App"])
    ]
)

