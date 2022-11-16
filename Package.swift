// swift-tools-version: 5.7

import PackageDescription

let package = Package(
  name: "Previews",
  platforms: [.iOS(.v13), .macOS(.v10_15)],
  products: [
    .library(
      name: "Previews",
      targets: ["Previews"]
    )
  ],
  dependencies: [],
  targets: [
    .target(
      name: "Previews",
      path: "Sources"
    ),
    .testTarget(
      name: "PreviewsTests",
      dependencies: ["Previews"],
      path: "Tests"
    )
  ]
)
