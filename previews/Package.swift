// swift-tools-version: 5.7

import PackageDescription

let package = Package(
  name: "Previews",
  platforms: [.iOS(.v13), .macOS(.v10_15)]
)

// MARK: - (TARGETS)

let main = Target.target(
  name: "Previews",
  path: "Sources"
)

let tests = Target.testTarget(
  name: "\(main.name)Tests",
  dependencies: [.target(name: main.name)],
  path: "Tests"
)

package.targets = [main, tests]

// MARK: - (PRODUCTS)

package.products.append(.library(name: package.name, targets: [main.name]))
