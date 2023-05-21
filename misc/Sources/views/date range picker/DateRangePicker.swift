////  Created by Leopold Lemmermann on 28.01.22.
//
//import SwiftUI
//
///// A date picker which lets you pick a range instead of a single date.
//public struct DateRangePicker: View {
//  @Binding private var unsafeRange: ClosedRange<Date>
//  var range: Binding<ClosedRange<Date>> {
//    Binding {
//      self.unsafeRange
//    } set: { newValue in
//      if self.bounds ~= newValue { self.unsafeRange = newValue }
//    }
//  }
//
//  let bounds: ClosedRange<Date>
//
//  public init(
//    _ range: Binding<ClosedRange<Date>>,
//    from minDate: Date? = nil,
//    to maxDate: Date? = nil
//  ) {
//    let min = minDate ?? Date(timeIntervalSince1970: 0),
//        max = maxDate ?? Date(timeIntervalSinceNow: 1_000_000)
//    bounds = Self.clean(min ... max)
//
//    _unsafeRange = range
//  }
//
//  @available(iOS 14, macOS 11, *)
//  public var body: some View {
//    VStack {
//      HStack {
//        // TODO: add gesture for swiping through months
//        Button(systemImage: "chevron.left") { navigateMonth(next: false) }
//
//        Spacer()
//
//        MonthYear(range.projectedValue, bounds: bounds)
//        Year(range.projectedValue, bounds: bounds)
//        Alltime(range.projectedValue, bounds: bounds)
//
//        Spacer()
//
//        Button(systemImage: "chevron.right") { navigateMonth(next: true) }
//      }
//      .padding()
//
//      Day(range.projectedValue, bounds: bounds, current: currentMonth)
//    }
//    .background(RoundedRectangle(cornerRadius: 10))
//    .padding()
//  }
//
//  @State private var showingMonthYearPicker = false
//  @State private var currentMonth = Date()
//}
//
//// MARK: - calculations
//
//private extension DateRangePicker {
//  func navigateMonth(next: Bool) {
//    let newMonth = currentMonth + TimeInterval(next ? 1 : -1, .month)
//    if bounds ~= newMonth {
//      withAnimation { currentMonth = newMonth }
//    }
//  }
//
//  static func clean(_ range: ClosedRange<Date>) -> ClosedRange<Date> {
//    (range.lowerBound.startOf(.day) ?? range.lowerBound) ... (range.upperBound.startOf(.day) ?? range.upperBound)
//  }
//}
//
//// MARK: - Previews
//
//struct DateRangePicker_Previews: PreviewProvider {
//  private static let range = Date() - TimeInterval(10, .day) ... Date() + TimeInterval(3, .day)
//  private static let bounds = Date() - TimeInterval(96, .day) ... Date() + TimeInterval(5, .day)
//
//  static var previews: some View {
//    PreviewBinding(range) {
//      DateRangePicker($0, from: bounds.lowerBound, to: bounds.upperBound)
//    }
//    .preferredColorScheme(.dark)
//  }
//}
