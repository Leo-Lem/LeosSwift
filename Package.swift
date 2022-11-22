// swift-tools-version: 5.7

import PackageDescription

// MARK: - (TARGETS)

let lib = Target.target(
  name: "LeosMisc",
  dependencies: ["Previews"],
  path: "Sources"
)

let tests = Target.testTarget(
  name: "\(lib.name)Tests",
  dependencies: [.target(name: lib.name)],
  path: "Tests"
)

// MARK: - (PRODUCTS)

let library = Product.library(
  name: lib.name,
  targets: [lib.name]
)

// MARK: - (DEPENDENCIES)

let previews = Package.Dependency.package(url: "https://github.com/Leo-Lem/Previews", branch: "main")

// MARK: - (PACKAGE)

let package = Package(
  name: library.name,
  platforms: [.iOS(.v13), .macOS(.v10_15)],
  products: [library],
  dependencies: [previews],
  targets: [lib, tests]
)
