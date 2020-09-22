// swift-tools-version:5.2

import PackageDescription

let package = Package(
    name: "Nordyvlasman",
    products: [
        .executable(
            name: "Nordyvlasman",
            targets: ["Nordyvlasman"]
        )
    ],
    dependencies: [
        .package(name: "Publish", url: "https://github.com/johnsundell/publish.git", from: "0.6.0"),
        .package(url: "https://github.com/Ze0nC/SwiftPygmentsPublishPlugin", .branch("master"))
    ],
    targets: [
        .target(
            name: "Nordyvlasman",
            dependencies: ["Publish", "SwiftPygmentsPublishPlugin"]
        )
    ]
)
