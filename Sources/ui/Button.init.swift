//	Created by Leopold Lemmermann on 09.10.22.

import SwiftUI

@available(iOS 14, macOS 11, *)
public extension Button where Label == Image {
  init(
    systemImage: String,
    action: @escaping () -> Void
  ) {
    self.init(action: action) { Image(systemName: systemImage) }
  }
}
