//	Created by Leopold Lemmermann on 20.11.22.

import Foundation

@propertyWrapper
public struct Persisted<T: Codable> {
  public var wrappedValue: T {
    didSet {
      do {
        try JSONEncoder()
          .encode(wrappedValue)
          .write(to: url)
      } catch {
        #if DEBUG
          print(error.localizedDescription)
        #endif
      }
    }
  }

  private let url: URL
  
  public init(wrappedValue: T, _ key: String) {
    do {
      url = Bundle.main.bundleURL.appendingPathComponent("\(key).json")

      self.wrappedValue = try JSONDecoder()
        .decode(
          T.self,
          from: try Data(contentsOf: url)
        )
    } catch {
      #if DEBUG
        print(error.localizedDescription)
      #endif
      self.wrappedValue = wrappedValue
    }
  }
}
