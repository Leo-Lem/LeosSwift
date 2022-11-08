//	Created by Leopold Lemmermann on 08.11.22.

public extension Query {
  init(_ bool: Bool, options: Options = Options()) {
    self.init(.bool(bool), options: options)
  }

  init(
    _ predicates: [Predicate],
    compound: Compound,
    options: Options = Options()
  ) {
    self.init(
      .predicates(predicates, compound: compound),
      options: options
    )
  }

  init(_ predicates: Predicate..., compound: Compound, options: Options = Options()) {
    self.init(predicates, compound: compound, options: options)
  }

  init<Value: CVarArg>(
    _ propertyName: String,
    _ comparison: Predicate.Comparison = .equal,
    _ value: Value,
    options: Options = Options()
  ) {
    self.init(
      .predicate(Predicate(propertyName, comparison, value)),
      options: options
    )
  }
}
