// swift-tools-version: 5.8

import PackageDescription

let package = Package(
  name: "LeosSwift",
  platforms: [.iOS(.v13), .macOS(.v10_15)]
)

// MARK: - (DEPENDENCIES)

package.dependencies = []

// MARK: - (TARGETS)

let concurrency = Target.target(name: "Concurrency")
let errors = Target.target(name: "Errors")
let misc = Target.target(name: "LeosMisc")
let previews = Target.target(name: "Previews")
let queries = Target.target(name: "Queries")

let libs = [concurrency, errors, misc, previews, queries]

package.targets = libs
  .flatMap {[
    $0,
    .testTarget(
      name: "\($0.name)Tests",
      dependencies: [.target(name: $0.name)],
      path: "Test/\($0.name)"
    )
  ]}

// MARK: - (PRODUCTS)

package.products = libs.map { .library(name: $0.name, targets: [$0.name]) }
