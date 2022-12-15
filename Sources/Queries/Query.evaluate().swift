// Created by Leopold Lemmermann on 15.12.22.

extension Query {
  public func evaluate(_ object: ResultType) -> Bool {
    switch predicateType {
    case let .bool(bool):
      return bool
    case let .predicate(predicate):
      return evaluate(object, with: predicate)
    case let .predicates(predicates, compound):
      switch compound {
      case .and: return predicates.allSatisfy { evaluate(object, with: $0) }
      case .or: return predicates.contains { evaluate(object, with: $0) }
      }
    }
  }
  
  func evaluate(_ object: ResultType, with predicate: Predicate) -> Bool {
    compare(predicate.comparison, lhs: predicate.value, rhs: getValue(for: predicate.name, of: object) as Any)
  }
  
  func getValue(for name: String, of object: ResultType) -> Any? {
    for child in Mirror(reflecting: object).children where child.label == name { return child.value }
    return nil
  }
  
  func compare<T>(_ comparison: Predicate.Comparison, lhs: T, rhs: T) -> Bool {
    switch comparison {
    case .equal: return areEqual(lhs: lhs, rhs: rhs)
    case .notEqual: return !areEqual(lhs: lhs, rhs: rhs)
    case .greater: return isGreater(lhs: lhs, rhs: rhs)
    case .lesser: return isLesser(lhs: lhs, rhs: rhs)
    case .greaterEven: return !isLesser(lhs: lhs, rhs: rhs)
    case .lesserEven: return !isGreater(lhs: lhs, rhs: rhs)
    }
  }
  
  func isLesser(lhs: Any, rhs: Any) -> Bool {
    guard let lhs = lhs as? any Comparable, let rhs = rhs as? any Comparable else { return false }
    return lhs.isLesser(rhs)
  }

  func isGreater(lhs: Any, rhs: Any) -> Bool {
    guard let lhs = lhs as? any Comparable, let rhs = rhs as? any Comparable else { return false }
    return lhs.isGreater(rhs)
  }

  func areEqual(lhs: Any, rhs: Any) -> Bool {
    guard let lhs = lhs as? any Equatable, let rhs = rhs as? any Equatable else { return false }
    return lhs.isEqual(rhs)
  }
}

extension Comparable {
  func isGreater(_ other: any Comparable) -> Bool {
    guard let other = other as? Self else { return other.isExactlyGreater(self) }
    return self > other
  }
  
  private func isExactlyGreater(_ other: any Comparable) -> Bool {
    guard let other = other as? Self else { return false }
    return self > other
  }
  
  func isLesser(_ other: any Comparable) -> Bool {
    guard let other = other as? Self else { return other.isExactlyLesser(self) }
    return self < other
  }
  
  private func isExactlyLesser(_ other: any Comparable) -> Bool {
    guard let other = other as? Self else { return false }
    return self < other
  }
}

extension Equatable {
  func isEqual(_ other: any Equatable) -> Bool {
    guard let other = other as? Self else { return other.isExactlyEqual(self) }
    return self == other
  }
    
  private func isExactlyEqual(_ other: any Equatable) -> Bool {
    guard let other = other as? Self else { return false }
    return self == other
  }
}
