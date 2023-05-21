// swift-tools-version: 5.7

import PackageDescription

// MARK: - (TARGETS)

let queries = Target.target(name: "Queries")

let keyPath = Target.target(
  name: "Queries.KeyPath",
  dependencies: [
    Target.Dependency.target(name: queries.name)
  ],
  path: "Sources/KeyPathQueries"
)

let nspredicate = Target.target(
  name: "Queries.NSPredicate",
  dependencies: [
    Target.Dependency.target(name: queries.name)
  ],
  path: "Sources/NSPredicate"
)

let tests = Target.testTarget(
  name: "\(queries.name)Tests",
  dependencies: [
    Target.Dependency.target(name: queries.name),
    Target.Dependency.target(name: nspredicate.name),
    Target.Dependency.target(name: keyPath.name),
  ],
  path: "Tests"
)

// MARK: - (PRODUCTS)

let library = Product.library(
  name: queries.name,
  targets: [queries.name, keyPath.name, nspredicate.name]
)

// MARK: - (PACKAGE)

let package = Package(
  name: library.name,
  platforms: [.iOS(.v13), .macOS(.v10_15)],
  products: [library],
  dependencies: [],
  targets: [queries, keyPath, nspredicate, tests]
)
