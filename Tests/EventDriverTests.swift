//	Created by Leopold Lemmermann on 04.12.22.

import Combine
@testable import Concurrency
import XCTest

class EventDriverTests: XCTestCase {
  func testPublisher() async {
    let driver = ExampleDriver()
    let expectation = XCTestExpectation(description: "Event can be received.")

    let cancellable = driver.eventPublisher.sink { _ in expectation.fulfill() }

    driver.eventPublisher.send(.something)

    wait(for: [expectation], timeout: 1)

    cancellable.cancel()
  }

  func testEvents() async {
    continueAfterFailure = true

    for _ in 1 ..< 1000 {
      let driver = ExampleDriver()
      let expectation = XCTestExpectation(description: "Event can be received.")

      let streamIsReady = XCTestExpectation(description: "Stream is ready.")

      Task {
        wait(for: [streamIsReady], timeout: 0.0001)
        driver.eventPublisher.send(.something)
        driver.eventPublisher.send(completion: .finished)
      }
      
      let events = driver.events
      streamIsReady.fulfill()
      for await _ in events { expectation.fulfill() }
      wait(for: [expectation], timeout: 0.0001)
    }

    continueAfterFailure = false
  }
}

class ExampleDriver: EventDriver {
  let eventPublisher = PassthroughSubject<Event, Never>()

  enum Event {
    case something,
         somethingElse
  }

  init() {}
}
