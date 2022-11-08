//	Created by Leopold Lemmermann on 17.10.22.

import CoreData

public extension NSPredicate {
  convenience init<T>(query: Query<T>) {
    switch query.predicateType {
    case let .bool(bool):
      self.init(value: bool)

    case let .predicate(predicate):
      self.init(format: predicate.formatString, predicate.value)

    case let .predicates(predicates, compound):
      if let predicate = predicates.first {
        var formatString = predicate.formatString
        var values = [Any]()

        for predicate in predicates.dropFirst() {
          formatString += " \(compound.symbol) "
          formatString += predicate.formatString
          values.append(predicate.value)
        }

        self.init(format: formatString, argumentArray: values)
      } else {
        self.init(value: false)
      }
    }
  }
}

private extension Query.Predicate {
  var formatString: String {
    "\(propertyName) \(comparison.symbol) \(value.replacementSymbol)"
  }
}

private extension Query.Predicate.Comparison {
  var symbol: String {
    switch self {
    case .equal: return "=="
    case .notEqual: return "!="
    case .greater: return ">"
    case .greaterEven: return ">="
    case .lesser: return "<"
    case .lesserEven: return "<="
    }
  }
}

private extension CVarArg {
  var replacementSymbol: String {
    switch self {
    case is Bool, is Int: return "%d"
    default: return "%@"
    }
  }
}

private extension Query.Compound {
  var symbol: String {
    switch self {
    case .and: return "AND"
    case .or: return "OR"
    }
  }
}
