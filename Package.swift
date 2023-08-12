// swift-tools-version:5.0
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "SwiftYoga",
    products: [
        .library(name: "SwiftYoga", targets: [ "SwiftYoga" ])
    ],
    dependencies: [
        .package(url: "https://github.com/facebook/yoga", .branch("main"))
    ],
    targets: [
        .target(
            name: "SwiftYoga",
            dependencies: [
                "yoga"
            ]
        ),
        .testTarget(
            name: "SwiftYogaTests",
            dependencies: [
                "SwiftYoga"
            ]
        )
    ]
)
