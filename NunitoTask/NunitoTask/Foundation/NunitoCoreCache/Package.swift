// swift-tools-version: 6.1
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "NunitoCoreCache",
    platforms: [
        .iOS(.v17)
    ],
    products: [
        .library(
            name: "NunitoCoreCache",
            targets: ["NunitoCoreCache"]),
    ],
    dependencies: [
        .package(path: "../NunitoCoreDomain")
    ],
    targets: [
        .target(
            name: "NunitoCoreCache",
            dependencies: [
                "NunitoCoreDomain"
            ]
        )
    ]
)
