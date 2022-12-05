//	Created by Leopold Lemmermann on 20.11.22.

import SwiftUI

@propertyWrapper
public struct Persisted<Value: Codable>: DynamicProperty {
  @State private var value: Value
  private let url: URL

  public var wrappedValue: Value {
    get { value }
    nonmutating set {
      try? JSONEncoder().encode(newValue).write(to: url)
      value = newValue
    }
  }

  public init(wrappedValue: Value, _ key: String) {
    url = Bundle.main.bundleURL.appendingPathComponent("\(key).json")
    _value = State(
      initialValue: (try? JSONDecoder().decode(Value.self, from: try Data(contentsOf: url))) ?? wrappedValue
    )
  }
}
