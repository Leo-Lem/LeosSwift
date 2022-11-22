//	Created by Leopold Lemmermann on 31.10.22.

import Foundation

@discardableResult
public func printError<T>(_ throwing: () throws -> T?) -> T? {
  do {
    return try throwing()
  } catch {
    print(error.localizedDescription)
  }
  return nil
}

// async variants

@_disfavoredOverload
@discardableResult
public func printError<T>(_ throwing: () async throws -> T) async -> T? {
  do {
    return try await throwing()
  } catch {
    print(error.localizedDescription)
  }
  return nil
}
