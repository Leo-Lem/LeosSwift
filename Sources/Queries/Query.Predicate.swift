//	Created by Leopold Lemmermann on 17.10.22.

public extension Query {
  struct Predicate {
    public let propertyName: String,
               comparison: Comparison,
               value: CVarArg

    public init(
      _ propertyName: String,
      _ comparison: Comparison = .equal,
      _ value: CVarArg
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
