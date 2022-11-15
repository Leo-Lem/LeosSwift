//	Created by Leopold Lemmermann on 15.11.22.

public extension LoadingState {
  mutating func finish(throwing: () throws -> () = {}) {
    do {
      try throwing()
      
      if case let .loading(elements) = self {
        self = .loaded(elements)
      } else {
        self = .loaded()
      }
    } catch {
      self = .failed(error)
    }
  }
  
  @_disfavoredOverload
  mutating func finish(throwing: () async throws -> () = {}) async {
    do {
      try await throwing()
      
      if case let .loading(elements) = self {
        self = .loaded(elements)
      } else {
        self = .loaded()
      }
    } catch {
      self = .failed(error)
    }
  }
}
