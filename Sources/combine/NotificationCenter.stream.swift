//	Created by Leopold Lemmermann on 02.12.22.

import Foundation

@available(iOS 15, macOS 12, *)
public extension NotificationCenter {
  func stream(for name: Notification.Name, object: AnyObject? = nil) -> AsyncStream<Notification> {
    publisher(for: name, object: object).stream
  }
}
