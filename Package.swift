// swift-tools-version: 5.7

import PackageDescription

let package = Package(
  name: "Queries",
  platforms: [.iOS(.v15)],
  products: [
    .library(name: "Queries", targets: ["Queries"]),
  ],
  dependencies: [],
  targets: [
    .target(name: "Queries"),
    .target(
      name: "Queries-KeyPath",
      dependencies: ["Queries"],
      path: "Sources/KeyPathQueries"
    ),
    .testTarget(name: "QueriesTests", dependencies: ["Queries"])
  ]
)
