// swift-tools-version: 5.7

import PackageDescription

let package = Package(
  name: "Concurrency",
  platforms: [.iOS(.v13), .macOS(.v10_15)],
  products: [
    .library(
      name: "Concurrency",
      targets: ["Concurrency"]
    )
  ],
  dependencies: [],
  targets: [
    .target(
      name: "Concurrency",
      path: "Sources"
    ),
    .testTarget(
      name: "ConcurrencyTests",
      dependencies: ["Concurrency"],
      path: "Tests"
    )
  ]
)
