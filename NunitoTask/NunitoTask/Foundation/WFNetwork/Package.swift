// swift-tools-version: 6.1
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "WFNetwork",
    platforms: [
        .iOS(.v17)
    ],
    products: [
        .library(
            name: "WFNetwork",
            targets: ["WFNetwork"]),
    ],
    targets: [
        .target(
            name: "WFNetwork"),
        .testTarget(
            name: "WFNetworkTests",
            dependencies: ["WFNetwork"]
        ),
    ]
)
