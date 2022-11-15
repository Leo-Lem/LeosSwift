//	Created by Leopold Lemmermann on 07.11.22.

//@available(iOS 16.0, macOS 13.0, *)
//public func sleep(for duration: Duration) async {
//  try? await Task.sleep(for: duration)
//}

import Foundation

public func sleep(for seconds: Double) async {
  try? await Task.sleep(nanoseconds: UInt64(seconds * 1_000_000_000))
}
