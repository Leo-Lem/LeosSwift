// swift-tools-version: 5.7

import PackageDescription

let package = Package(
  name: "Queries",
  platforms: [.iOS(.v15), .macOS(.v13)],
  products: [
    .library(name: "Queries", targets: ["Queries", "Queries.KeyPath", "Queries.NSPredicate"])
  ],
  dependencies: [],
  targets: [
    .target(name: "Queries"),
    .target(
      name: "Queries.KeyPath",
      dependencies: ["Queries"],
      path: "Sources/KeyPathQueries"
    ),
    .target(
      name: "Queries.NSPredicate",
      dependencies: ["Queries"],
      path: "Sources/NSPredicate"
    )
  ]
)
