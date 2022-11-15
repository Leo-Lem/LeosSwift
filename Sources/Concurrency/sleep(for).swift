//	Created by Leopold Lemmermann on 07.11.22.

//@available(iOS 16.0, macOS 13.0, *)
//public func sleep(for duration: Duration) async {
//  try? await Task.sleep(for: duration)
//}

import Foundation

public func sleep<T: Numeric>(for seconds: T) async {
  switch seconds * 1_000_000_000 {
  case let float as any BinaryFloatingPoint:
    try? await Task.sleep(nanoseconds: UInt64(Double(float)))
  case let int as any BinaryInteger:
    try? await Task.sleep(nanoseconds: UInt64(int))
  default:
    return
  }
}
