//	Created by Leopold Lemmermann on 07.11.22.

@available(iOS 16, macOS 13, *)
public func sleep(for duration: Duration) async {
  try? await Task.sleep(for: duration)
}

import Foundation

public func sleep(for seconds: Int) async {
  try? await Task.sleep(nanoseconds: UInt64(seconds) * NSEC_PER_SEC)
}
