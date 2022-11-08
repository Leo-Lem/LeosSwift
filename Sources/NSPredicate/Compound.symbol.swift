//	Created by Leopold Lemmermann on 08.11.22.

import Queries

extension Query.Compound {
  var symbol: String {
    switch self {
    case .and: return "AND"
    case .or: return "OR"
    }
  }
}
