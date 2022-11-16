// swift-tools-version: 5.7

import PackageDescription

let package = Package(
  name: "PACKAGE",
  platforms: [.iOS(.v13), .macOS(.v10_15)],
  products: [
    .library(
      name: "PACKAGE",
      targets: ["TARGET"]
    )
  ],
  dependencies: [],
  targets: [
    .target(
      name: "TARGET"
    ),
    .testTarget(
      name: "TESTTARGET",
      dependencies: ["TARGET"],
      path: "Tests"
    )
  ]
)
