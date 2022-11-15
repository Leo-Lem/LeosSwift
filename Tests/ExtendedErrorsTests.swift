@testable import ExtendedErrors
import XCTest

final class ExtendedErrorsTests: XCTestCase {
  func testPrintingError() {
    printError {
      throw ExampleError.sumTingWong
    }
  }
  
  func testMappingError() {
    do {
      try mapError(to: ExampleError.sumTingElseWong) {
        throw ExampleError.sumTingWong
      }
    } catch {
      XCTAssertEqual(error as? ExampleError, ExampleError.sumTingElseWong, "The error wasn't mapped...")
    }
  }
}
