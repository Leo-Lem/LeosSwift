//	Created by Leopold Lemmermann on 08.11.22.

import Queries

public extension Query.Predicate where ResultType: KeyPathQueryable {
  init<Value: CVarArg>(
    _ keyPath: PartialKeyPath<ResultType>,
    _ comparison: Comparison = .equal,
    _ value: Value
  ) {
    self.init(keyPath.propertyName!, comparison, value)
  }
}
