//	Created by Leopold Lemmermann on 25.10.22.

public enum LoadingState<T> {
  case idle,
       loading([T]),
       loaded([T] = []),
       failed(Error?)
}

public extension LoadingState: Equatable where T: Equatable {
  static func == (lhs: LoadingState<T>, rhs: LoadingState<T>) -> Bool {
    switch (lhs, rhs) {
    case (.idle, .idle):
      return true
    case let (.loading(lhsItems), .loading(rhsItems)):
      return rhsItems == lhsItems
    case let (.loaded(lhsItems), .loaded(rhsItems)):
      return rhsItems == lhsItems
    default:
      return false
    }
  }
}

public extension LoadingState {
  mutating func add(elements: T...) { add(elements: elements) }
  mutating func add(elements: [T]) {
    switch self {
    case let .loading(array):
      self = .loading(array + elements)
    case .loaded:
      self = .loading(elements)
    default:
      self = .loading(elements)
    }
  }

  mutating func update(elements: T...) { update(elements: elements) }
  mutating func update(elements: [T]) {
    switch self {
    case .loading:
      self = .loading(elements)
    case .loaded:
      self = .loaded(elements)
    default:
      self = .loading(elements)
    }
  }

  mutating func setLoaded() {
    if case let .loading(array) = self {
      self = .loaded(array)
    } else {
      self = .loaded()
    }
  }
}
