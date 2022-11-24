//	Created by Leopold Lemmermann on 08.11.22.

import Queries

extension Query.Predicate {
  var formatString: String {
    "\(name) \(comparison.symbol) \(replacementSymbol)"
  }
}
