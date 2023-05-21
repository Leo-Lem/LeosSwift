// swift-tools-version: 5.8

import PackageDescription

let package = Package(
  name: "LeosSwift",
  platforms: [.iOS(.v16), .macOS(.v12)]
)

// MARK: - (DEPENDENCIES)

package.dependencies = []

// MARK: - (TARGETS)

let concurrency = Target.target(name: "Concurrency")
let errors = Target.target(name: "Errors")
let previews = Target.target(name: "Previews")
let queries = Target.target(name: "Queries")

let misc = Target.target(name: "LeosMisc", dependencies: [.byName(name: previews.name)])

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
