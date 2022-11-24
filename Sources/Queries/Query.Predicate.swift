//	Created by Leopold Lemmermann on 17.10.22.

public extension Query {
  struct Predicate {
    public let name: String,
               comparison: Comparison,
               value: Any

    public init<Value>(_ name: String, _ value: Value) { self.init(name, .equal, value) }
    public init<Value>(
      _ name: String,
      _ comparison: Comparison,
      _ value: Value
    ) {
      self.name = name
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
