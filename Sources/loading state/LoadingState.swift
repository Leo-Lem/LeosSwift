//	Created by Leopold Lemmermann on 25.10.22.

public enum LoadingState<T> {
  case idle,
       loading([T]),
       loaded([T] = []),
       failed(Error?)
}

extension LoadingState: Codable where T: Codable {
  public func encode(to encoder: Encoder) throws {
    var container = encoder.singleValueContainer()
    try container.encode(wrapped)
  }
  
  public init(from decoder: Decoder) throws {
    let container = try decoder.singleValueContainer()
    self = .loaded(try container.decode([T].self))
  }
}
