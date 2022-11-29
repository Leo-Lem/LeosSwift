//	Created by Leopold Lemmermann on 14.11.22.

import XCTest
import Concurrency

@available(iOS 16, macOS 13, *)
final class AsyncStreamsTests: XCTestCase {
  func testAsyncInit() async {
    let stream = AsyncStream { continuation in
      for i in 0..<10 {
        continuation.yield(i)
        await sleep(for: .seconds(0.1))
      }

      continuation.finish()
    }

    for await element in stream {
      XCTAssertNotNil(element, "No element was produced")
    }
  }

  func testCollect() async throws {
    let stream = AsyncThrowingStream { continuation in
      for i in 0..<10 {
        continuation.yield(i)
        await sleep(for: .seconds(0.1))
      }

      continuation.finish()
    }
    
    let otherStream = AsyncStream { continuation in
      for i in 0..<10 {
        continuation.yield(i)
        await sleep(for: .seconds(0.1))
      }

      continuation.finish()
    }

    try await stream.collect()
    await otherStream.collect()
  }

  func testMapErrorFinishes() async throws {
    let stream = AsyncThrowingStream { continuation in
      for i in 0..<10 {
        continuation.yield(i)
        await sleep(for: .seconds(0.1))
      }

      continuation.finish()
    }
      .mapError { $0 }

    for try await _ in stream {}
  }
  
  func testMappingStream() async throws {
    let stream = AsyncThrowingStream { continuation in
      for i in 0..<10 {
        continuation.yield(i)
        await sleep(for: .seconds(0.1))
      }

      continuation.finish()
    }
    
    let otherStream = AsyncStream { continuation in
      for i in 0..<10 {
        continuation.yield(i)
        await sleep(for: .seconds(0.1))
      }

      continuation.finish()
    }
    
    _ = stream.map(String.init)
    _ = otherStream.map(String.init)
  }
}
