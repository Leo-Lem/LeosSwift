// swift-tools-version: 5.7

import PackageDescription

// MARK: - (TARGETS)

let lib = Target.target(
  name: "LeosMisc",
  path: "Sources"
)

let tests = Target.testTarget(
  name: "LeosMiscTests",
  dependencies: [.target(name: lib.name)],
  path: "Tests"
)

// MARK: - (PRODUCTS)

let library = Product.library(
  name: "LeosMisc",
  targets: [lib.name]
)

// MARK: - (PACKAGE)

let package = Package(
  name: library.name,
  platforms: [.iOS(.v13), .macOS(.v10_15)],
  products: [library],
  dependencies: [],
  targets: [lib, tests]
)
