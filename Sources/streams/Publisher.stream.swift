//	Created by Leopold Lemmermann on 02.12.22.

import protocol Combine.Publisher
import class Foundation.RunLoop

@available(iOS 15, macOS 12, *)
public extension Publisher where Failure == Never {
  var stream: AsyncStream<Output> {
    AsyncStream { continuation in
      for await element in receive(on: RunLoop.main).values { continuation.yield(element) }
      continuation.finish()
    }
  }
}

@available(iOS 15, macOS 12, *)
public extension Publisher where Failure == Error {
  var stream: AsyncThrowingStream<Output, Error> {
    AsyncThrowingStream { continuation in
      do {
        for try await element in receive(on: RunLoop.main).values { continuation.yield(element) }
        continuation.finish()
      } catch { continuation.finish(throwing: error) }
    }
  }
}
