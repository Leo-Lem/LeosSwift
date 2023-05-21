// swift-tools-version: 5.8

import PackageDescription

let package = Package(
  name: "LeosSwift",
  platforms: [.iOS(.v13), .macOS(.v10_15)]
)

// MARK: - (DEPENDENCIES)

package.dependencies = []

// MARK: - (TARGETS)

let misc = Target.target(name: "LeosMisc")

package.targets = [misc]
  .flatMap {[
    $0,
    .testTarget(
      name: "\(misc.name)Tests",
      dependencies: [.target(name: misc.name)],
      path: "Test/\(misc.name)"
    )
  ]}

// MARK: - (PRODUCTS)

package.products = [
  .library(name: misc.name, targets: [misc.name])
]
