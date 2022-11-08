//	Created by Leopold Lemmermann on 08.11.22.

public extension Query {
  enum PredicateType {
    case bool(Bool),
         predicate(Predicate),
         predicates([Predicate], compound: Compound)
  }
}
