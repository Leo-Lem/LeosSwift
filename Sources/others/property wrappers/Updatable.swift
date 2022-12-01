//	Created by Leopold Lemmermann on 30.11.22.

import Combine
import Concurrency

@available(iOS 15, macOS 12, *)
@propertyWrapper
public class Updatable<Value> {
  public var wrappedValue: Value

  private let tasks = Tasks()

  public init(wrappedValue: Value) { self.wrappedValue = wrappedValue }

  public func startUpdates<P: Publisher>(
    listeningTo publisher: P,
    newValue: @escaping (P.Output) async -> Value
  ) where P.Failure == Never {
    tasks["update"] = publisher.getTask { output in
      self.wrappedValue = await newValue(output)
    }
  }
}
