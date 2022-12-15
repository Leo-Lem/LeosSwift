//	Created by Leopold Lemmermann on 17.10.22.

import CoreData
@_exported import Queries

public extension Query {
  func getNSPredicate() -> NSPredicate {
    switch predicateType {
    case let .bool(bool):
      return NSPredicate(value: bool)

    case let .predicate(predicate):
      return NSPredicate(format: predicate.formatString, argumentArray: [predicate.value])

    case let .predicates(predicates, compound):
      if let predicate = predicates.first {
        var formatString = predicate.formatString
        var values = [predicate.value]

        for predicate in predicates.dropFirst() {
          formatString += " \(compound.symbol) "
          formatString += predicate.formatString
          values.append(predicate.value)
        }

        return NSPredicate(format: formatString, argumentArray: values)
      }
    }

    return NSPredicate(value: false)
  }
}
