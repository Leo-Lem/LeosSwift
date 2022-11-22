@testable import Errors
import XCTest

final class ErrorsTests: XCTestCase {
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
  
  func testWritingError() {
    do {
      var error = ExampleError.sumTingWong
      
      try writeError(to: &error) {
        throw ExampleError.sumTingElseWong
      }
      
      XCTAssertEqual(error, .sumTingElseWong, "The error wasn't written.")
    } catch {}
  }
}
