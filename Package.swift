// swift-tools-version: 5.7

import PackageDescription

let package = Package(
  name: "Extended Concurrency",
  platforms: [.iOS(.v13), .macOS(.v10_15)],
  products: [
    .library(
      name: "ExtendedConcurrency",
      targets: ["ExtendedConcurrency"]
    )
  ],
  dependencies: [],
  targets: [
    .target(name: "ExtendedConcurrency"),
    .testTarget(
      name: "ExtendedConcurrencyTests",
      dependencies: ["ExtendedConcurrency"],
      path: "Tests"
    )
  ]
)
