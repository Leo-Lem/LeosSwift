//	Created by Leopold Lemmermann on 08.11.22.

import Queries

extension Query where ResultType: KeyPathQueryable {
  init<Value: CVarArg>(
    _ keyPath: PartialKeyPath<ResultType>,
    _ comparison: Predicate.Comparison = .equal,
    _ value: Value,
    options: Options = Options()
  ) {
    self.init(
      keyPath.propertyName!,
      comparison,
      value,
      options: options
    )
  }

  @_disfavoredOverload
  init(id: CVarArg, options: Options = Options()) where ResultType: Identifiable {
    self.init(\ResultType.id, .equal, id, options: options)
  }
}
