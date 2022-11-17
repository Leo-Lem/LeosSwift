//	Created by Leopold Lemmermann on 29.10.22.

import Combine

@available(iOS 15, macOS 12, *)
public extension Publisher {
  /// Transforms the publisher to a task, executing an operation whenever a value is received.
  /// - Parameters:
  ///   - priority: The Task priority (defaults to .background).
  ///   - operation: The operation to execute when an element is received.
  /// - Returns: The resulting Task (rethrowing, so to speak).
  func getTask(
    _ priority: TaskPriority = .background,
    operation: @escaping (Output) async throws -> Void
  ) -> Task<Void, Failure> where Failure == Error {
    Task(priority: priority) {
      try await useValues(operation)
    }
  }

  /// Transforms the publisher to a task, executing an operation whenever a value is received.
  /// - Parameters:
  ///   - priority: The Task priority (defaults to .background).
  ///   - operation: The operation to execute when an element is received.
  /// - Returns: The resulting Task (rethrowing, so to speak).
  func getTask(
    _ priority: TaskPriority = .background,
    operation: @escaping (Output) async -> Void
  ) -> Task<Void, Never> where Failure == Never {
    Task(priority: priority) {
      await useValues(operation)
    }
  }
}
