// swift-tools-version: 5.7

import PackageDescription

let package = Package(
  name: "ExtendedErrors",
  platforms: [.iOS(.v13), .macOS(.v10_15)],
  products: [
    .library(
      name: "ExtendedErrors",
      targets: ["ExtendedErrors"]
    )
  ],
  dependencies: [],
  targets: [
    .target(
      name: "ExtendedErrors"
    ),
    .testTarget(
      name: "ExtendedErrorsTests",
      dependencies: ["ExtendedErrors"],
      path: "Tests"
    )
  ]
)
