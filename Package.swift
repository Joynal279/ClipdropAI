// swift-tools-version: 5.10
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "ClipdropAI",
    products: [
        // Products define the executables and libraries a package produces, making them visible to other packages.
        .library(
            name: "ClipdropAI",
            targets: ["ClipdropAI"]),
    ],
    dependencies: [
        .package(url: "https://github.com/Alamofire/Alamofire.git", .upToNextMajor(from: "5.9.1"))
    ],
    targets: [
        // Targets are the basic building blocks of a package, defining a module or a test suite.
        // Targets can depend on other targets in this package and products from dependencies.
        .target(
            name: "ClipdropAI",
            dependencies: ["Alamofire"],
            path: "Sources", 
            resources: [
                .process("Resources/Media.xcassets")
            ]),
        .testTarget(
            name: "ClipdropAITests",
            dependencies: ["ClipdropAI"]),
    ]
)
