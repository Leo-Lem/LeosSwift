//	Created by Leopold Lemmermann on 27.10.22.

import SwiftUI

public extension View {
  @available(iOS 16, macOS 13, *)
  func navigationDestination<T, V: View>(optional: Binding<T?>, @ViewBuilder destination: (T) -> V) -> some View {
    navigationDestination(isPresented: Binding(optional: optional)) {
      if let value = optional.wrappedValue {
        destination(value)
      }
    }
  }
}
