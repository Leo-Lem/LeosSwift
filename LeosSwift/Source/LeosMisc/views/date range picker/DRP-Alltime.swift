////  Created by Leopold Lemmermann on 28.01.22.
//
//import SwiftUI
//
//extension DateRangePicker {
//  struct Alltime: View {
//    @Binding var range: ClosedRange<Date>
//    let bounds: ClosedRange<Date>
//
//    init(_ range: Binding<ClosedRange<Date>>, bounds: ClosedRange<Date>) {
//      _range = range
//      self.bounds = bounds
//    }
//
//    var body: some View {
//      Button("Alltime") {
//        self.range = self.bounds
//      }
//    }
//  }
//}
//
//// MARK: - Previews
//
//struct DateRangePicker_Alltime_Previews: PreviewProvider {
//  private static let range = Date() - TimeInterval(10, .day) ... Date() + TimeInterval(3, .day)
//  private static let bounds = Date() - TimeInterval(100, .day) ... Date() + TimeInterval(5, .day)
//
//  static var previews: some View {
//    PreviewBinding(range) { DateRangePicker.Alltime($0, bounds: bounds) }
//      .preferredColorScheme(.dark)
//  }
//}
