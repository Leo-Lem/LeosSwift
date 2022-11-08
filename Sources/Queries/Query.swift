//	Created by Leopold Lemmermann on 17.10.22.

public struct Query<ResultType> {
  let predicateType: PredicateType,
      options: Options

  init(
    _ predicateType: PredicateType,
    options: Options = Options()
  ) {
    self.predicateType = predicateType
    self.options = options
  }
}

public extension Query {
  enum Compound {
    case and, or
  }
}

extension Query {
  enum PredicateType {
    case bool(Bool),
         predicate(Predicate),
         predicates([Predicate], compound: Compound)
  }
}
