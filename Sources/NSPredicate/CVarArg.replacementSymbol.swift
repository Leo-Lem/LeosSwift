//	Created by Leopold Lemmermann on 08.11.22.

import Queries

extension Query.Predicate {
  var replacementSymbol: String {
    switch value {
    case is Bool, is Int:
      return "%d"
    default:
      return "%@"
    }
  }
}
