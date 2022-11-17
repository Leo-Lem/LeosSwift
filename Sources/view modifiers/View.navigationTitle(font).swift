//	Created by Leopold Lemmermann on 05.11.22.

#if canImport(UIKit)
  import SwiftUI

  @available(iOS 14, *)
  public extension View {
    func styledNavigationTitle(_ title: Text, style: Font.TextStyle = .largeTitle) -> some View {
      UINavigationBar.appearance().largeTitleTextAttributes = [
        .font: Font.system(style)
      ]

      return navigationTitle(title)
    }

    func styledNavigationTitle(_ title: LocalizedStringKey, style: Font.TextStyle = .largeTitle) -> some View {
      styledNavigationTitle(Text(title), style: style)
    }

    func styledNavigationTitle<S: StringProtocol>(raw title: S, style: Font.TextStyle = .largeTitle) -> some View {
      styledNavigationTitle(Text(title), style: style)
    }
  }
#endif
