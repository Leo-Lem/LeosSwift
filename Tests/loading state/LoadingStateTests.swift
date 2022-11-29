//	Created by Leopold Lemmermann on 15.11.22.

@testable import Concurrency
import XCTest

final class LoadingStateTests: XCTestCase {
  func testAddingElementStartsLoading() {
    var state = LoadingState<String>.idle

    let element = "Hello"
    state.add(element)
    state.wrapped?.append(element)

    XCTAssertEqual(state, .loading([element, element]), "Loading State is not loading with the correct elements.")
  }

  func testSettingLoadedRetainsElements() {
    var state = LoadingState<String>.idle

    let element = "Hello"
    state.add(element)

    state.finish()

    XCTAssertEqual(state, .loaded([element]), "Loading State is not loaded with the correct elements.")
  }

  func testUpdatingElementsOverridesOldElements() {
    var state = LoadingState<String>.idle

    let element1 = "Hello"
    let element2 = "Goodbye"
    state.add(element1)
    state.update(element2)
    state.finish()

    XCTAssertEqual(state.wrapped, [element2], "Loading State does not contain updated elements.")
  }

  func testFailingKeepsCorrectError() {
    var state = LoadingState<String>.idle

    let error = ExampleError.sumTingWong
    state.finish { throw error }

    if case let .failed(otherError) = state {
      XCTAssertEqual(error, otherError as? ExampleError, "Loading State does not hold specific error.")
    } else {
      XCTFail("Loading State is not failed.")
    }
  }
}
