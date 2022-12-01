// swift-tools-version: 5.7

import PackageDescription

let package = Package(
  name: "LeosMisc",
  platforms: [.iOS(.v13), .macOS(.v10_15)]
)

// MARK: - (DEPENDENCIES)

let mine = (
  previews: "Previews",
  concurrency: "Concurrency"
)

for name in [mine.previews, mine.concurrency] {
  package.dependencies.append(.package(url: "https://github.com/Leo-Lem/\(name)", branch: "main"))
}

// MARK: - (TARGETS)

let lib = Target.target(
  name: "LeosMisc",
  dependencies: [
    .byName(name: mine.concurrency),
    .byName(name: mine.previews)
  ],
  path: "Sources"
)

let tests = Target.testTarget(
  name: "\(lib.name)Tests",
  dependencies: [.target(name: lib.name)],
  path: "Tests"
)

package.targets = [lib, tests]

// MARK: - (PRODUCTS)

package.products.append(.library(name: package.name, targets: [lib.name]))
