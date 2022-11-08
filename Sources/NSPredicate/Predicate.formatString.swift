//	Created by Leopold Lemmermann on 08.11.22.

import Queries

extension Query.Predicate {
  var formatString: String {
    "\(propertyName) \(comparison.symbol) \(value.replacementSymbol)"
  }
}
