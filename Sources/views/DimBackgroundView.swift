//	Created by Leopold Lemmermann on 06.11.22.

import SwiftUI

@available(iOS 15, macOS 12, *)
public struct DimBackgroundView: View {
  let dismissOnClick: Bool,
      material: Material

  public var body: some View {
    VStack {}
      .frame(maxWidth: .infinity, maxHeight: .infinity)
      .ignoresSafeArea()
      .background(material.opacity(0.9))
      .onTapGesture {
        if dismissOnClick { dismiss() }
      }
  }

  @Environment(\.dismiss) private var dismiss

  public init(
    dismissOnClick: Bool = true,
    material: Material = .regular
  ) {
    self.dismissOnClick = dismissOnClick
    self.material = material
  }
}
