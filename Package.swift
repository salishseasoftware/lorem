// swift-tools-version:5.3
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "lorem",
    platforms: [.macOS(.v11)],
    products: [.executable(name: "lorem", targets: ["lorem"])],
    dependencies: [
        .package(url: "https://github.com/apple/swift-argument-parser", from: "1.0.0"),
        .package(url: "https://github.com/lukaskubanek/LoremSwiftum.git", from: "2.2.1"),
        .package(url: "https://github.com/salishseasoftware/Stringy.git", from: "1.0.0"),
    ],
    targets: [
        // Targets are the basic building blocks of a package. A target can define a module or a test suite.
        // Targets can depend on other targets in this package, and on products in packages this package depends on.
        .target(
            name: "lorem",
            dependencies: [
                .product(name: "ArgumentParser", package: "swift-argument-parser"),
                .product(name: "LoremSwiftum", package: "LoremSwiftum"),
            ]),
        .testTarget(
            name: "loremTests",
            dependencies: [
                "lorem",
                .product(name: "LibStringy", package: "Stringy"),
            ]),
    ]
)
