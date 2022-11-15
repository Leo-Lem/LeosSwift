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
    .target(name: "Concurrency"),
    .testTarget(
      name: "ConcurrencyTests",
      dependencies: ["Concurrency"],
      path: "Tests"
    )
  ]
)
