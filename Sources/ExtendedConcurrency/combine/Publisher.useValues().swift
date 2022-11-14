//	Created by Leopold Lemmermann on 29.10.22.

import Combine

@available(iOS 15, macOS 12, *)
public extension Publisher {
  /// Executes certain actions when a publisher fires or ends (rethrows, depending on the Publisher).
  /// - Parameters:
  ///   - receive: A receive action, whenever a value is received.
  ///   - finally: A finally action, when the publisher finishes.
  func useValues(
    _ receive: (Output) async throws -> Void,
    finally: () async throws -> Void = {}
  ) async throws where Failure == Error {
    for try await output in values {
      try await receive(output)
    }

    try await finally()
  }

  /// Executes certain actions when a publisher fires or ends (rethrows, depending on the Publisher).
  /// - Parameters:
  ///   - receive: A receive action, whenever a value is received.
  ///   - finally: A finally action, when the publisher finishes.
  func useValues(
    _ receive: (Output) async -> Void,
    finally: () async -> Void = {}
  ) async where Failure == Never {
    for await output in values {
      await receive(output)
    }

    await finally()
  }
}
