// swift-tools-version:4.0
import PackageDescription

let package = Package(
    name: "RoadChatKit",
    products: [
        .library(name: "RoadChatKit", targets: ["RoadChatKit"]),
    ],
    dependencies: [],
    targets: [
        .target(name: "RoadChatKit", dependencies: [], path: "./Sources"),
    ]
)
