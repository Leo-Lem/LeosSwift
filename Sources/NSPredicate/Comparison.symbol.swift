//	Created by Leopold Lemmermann on 08.11.22.

import Queries

extension Query.Predicate.Comparison {
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
