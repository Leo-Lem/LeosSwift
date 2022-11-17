//	Created by Leopold Lemmermann on 07.11.22.

import Foundation

public func sleep(for duration: Duration) async {
  await Task.sleep(for: duration)
}

// backwards compatibility
extension Task where Success == Never, Failure == Never {
  @available(iOS, obsoleted: 16)
  @available(macOS, obsoleted: 13)
  @_disfavoredOverload
  static func sleep(for duration: Duration) async {
    guard case let .seconds(seconds) = duration else { return }

    try? await Task.sleep(nanoseconds: UInt64(seconds * 1_000_000_000))
  }
}

@available(iOS, obsoleted: 16)
@available(macOS, obsoleted: 13)
public enum Duration {
  case seconds(Double)
}
