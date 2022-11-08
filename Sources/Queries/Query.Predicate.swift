//	Created by Leopold Lemmermann on 17.10.22.

public extension Query {
  struct Predicate {
    let propertyName: String,
        comparison: Comparison,
        value: CVarArg

    public init<Value: CVarArg>(
      _ propertyName: String,
      _ comparison: Comparison = .equal,
      _ value: Value
    ) {
      self.propertyName = propertyName
      self.comparison = comparison
      self.value = value
    }
  }
}

public extension Query.Predicate {
  enum Comparison {
    case equal,
         notEqual,
         greater,
         greaterEven,
         lesser,
         lesserEven
  }
}
