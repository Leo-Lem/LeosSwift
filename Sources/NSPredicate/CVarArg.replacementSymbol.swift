//	Created by Leopold Lemmermann on 08.11.22.

extension CVarArg {
  var replacementSymbol: String {
    switch self {
    case is Bool, is Int: return "%d"
    default: return "%@"
    }
  }
}
