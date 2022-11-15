@testable import ExtendedErrors
import XCTest

final class ExtendedErrorsTests: XCTestCase {
  func testPrintingError() {
    printError {
      throw ExampleError.sumTingWong
    }
    
    let string = "HELLO"
    let result = printError {
      string
    }
    
    XCTAssertEqual(result, string, "The returned result does not equal the input.")
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
