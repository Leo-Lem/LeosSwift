//
//import Previews
//import SwiftUI
//
//@available(iOS 16, macOS 13, *)
//public extension View {
//  func banner<C: View>(
//    isPresented: Binding<Bool>,
//    dismissAfter: Duration? = nil,
//    dragToDismiss: Bool = true,
//    animation: Animation = .default,
//    @ViewBuilder content: @escaping () -> C
//  ) -> some View {
//    modifier(BannerModifier(
//      isPresented: isPresented,
//      dismissAfter: dismissAfter,
//      dragToDismiss: dragToDismiss,
//      animation: animation,
//      banner: content
//    ))
//  }
//
//  func banner<T: Identifiable, C: View>(
//    presenting item: Binding<T?>,
//    dismissAfter: Duration? = nil,
//    dragToDismiss: Bool = true,
//    animation: Animation = .default,
//    @ViewBuilder content: @escaping (T) -> C
//  ) -> some View {
//    banner(
//      isPresented: Binding(optional: item),
//      dismissAfter: dismissAfter,
//      dragToDismiss: dragToDismiss,
//      animation: animation
//    ) {
//      if let value = item.wrappedValue { content(value) }
//    }
//  }
//}
//
//@available(iOS 16, macOS 13, *)
//private struct BannerModifier<C: View>: ViewModifier {
//  @Binding var isPresented: Bool
//
//  let dismissAfter: Duration?,
//      dragToDismiss: Bool,
//      animation: Animation,
//      banner: () -> C
//
//  @GestureState(resetTransaction: Transaction(animation: .default))
//  private var dragOffset = CGSize.zero
//  private var dragGesture: some Gesture {
//    DragGesture()
//      .updating($dragOffset) { value, state, _ in
//        guard dragToDismiss else { return }
//
//        state.height = min(80, value.translation.height)
//      }
//      .onEnded { value in
//        guard dragToDismiss else { return }
//
//        if value.translation.height <= -35 {
//          isPresented = false
//        }
//      }
//  }
//
//  func body(content: Content) -> some View {
//    content
//      .if(isPresented) { $0
//        .overlay(alignment: .top) {
//          banner()
//            .offset(y: dragOffset.height)
//            .simultaneousGesture(dragGesture)
//            .transition(.move(edge: .top).combined(with: .opacity))
//        }
////          .task {
////            if let delay = dismissAfter {
////              try? await Task.sleep(for: delay)
////              isPresented = false
////            }
////          }
//      }
//      .animation(animation, value: isPresented)
//  }
//}
//
//// MARK: - (PREVIEWS)
//
//#if DEBUG
//  @available(iOS 16, macOS 13, *)
//  struct Banner_Previews: PreviewProvider {
//    static var previews: some View {
//      Group {
//        Binding.Preview(false) { showingBanner in
//          Button("[ Banner ]") { showingBanner.wrappedValue.toggle() }
//            .frame(maxWidth: .infinity, maxHeight: .infinity)
//            .banner(isPresented: showingBanner) {
//              Text("I'm a banner!")
//            }
//        }
//      }
//    }
//  }
//#endif
