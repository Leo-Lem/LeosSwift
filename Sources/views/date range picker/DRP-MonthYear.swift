////  Created by Leopold Lemmermann on 28.01.22.
//
//import SwiftUI
//
//extension DateRangePicker {
//  struct MonthYear: View {
//    @Binding var range: ClosedRange<Date>
//    let bounds: ClosedRange<Date>
//
//    init(_ range: Binding<ClosedRange<Date>>, bounds: ClosedRange<Date>) {
//      _range = range
//      self.bounds = bounds
//    }
//
//    var body: some View {
//      Picker("", selection: $range) {
//        ForEach(months, id: \.id) { month, year, _ in
//          Text("\(format(month, year))")
//            .tag(tag(month, year))
//        }
//      }
//    }
//  }
//}
//
//// MARK: - calculations
//
//private extension DateRangePicker.MonthYear {
//  var months: [(Int, Int, id: String)] {
//    // TODO: figure out how to get rid of the id tuple component
//    let minComps = Calendar.current.dateComponents([.month, .year], from: bounds.lowerBound),
//        maxComps = Calendar.current.dateComponents([.month, .year], from: bounds.upperBound),
//        min = (month: minComps.month!, year: minComps.year!),
//        max = (month: maxComps.month!, year: maxComps.year!)
//
//    return Array(min.year ... max.year)
//      .flatMap { year in
//        Array((year == min.year ? min.month : 1) ... (year == max.year ? max.month : 12))
//          .map { month in (month, year, "\(month)\(year)") }
//      }
//  }
//
//  func format(_ month: Int, _ year: Int) -> String {
//    let comps = DateComponents(year: year, month: month),
//        date = Calendar.current.date(from: comps),
//        formatter = DateFormatter(withDateFormat: "MMMM yyyy")
//
//    return formatter.string(from: date!)
//  }
//
//  func tag(_ month: Int, _ year: Int) -> ClosedRange<Date> {
//    guard let newDate = DateComponents(year: year, month: month).date?.startOf(.month) else { return range }
//    let lower = range.lowerBound.startOf(.month) ?? range.lowerBound
//    let upper = range.upperBound.endOf(.month) ?? range.upperBound
//    let mid = lower + (lower.distance(to: upper, unit: .second) ?? 0) / 2
//
//    switch newDate {
//    case ..<mid: return newDate ... upper
//    case mid...: return lower ... newDate
//    default: return range
//    }
//  }
//}
//
//// MARK: - Previews
//
//struct DateRangePicker_MonthYear_Previews: PreviewProvider {
//  private static let range = Date() - TimeInterval(10, .day) ... Date() + TimeInterval(3, .day)
//  private static let bounds = Date() - TimeInterval(100, .day) ... Date() + TimeInterval(5, .day)
//
//  static var previews: some View {
//    PreviewBinding(range) { DateRangePicker.MonthYear($0, bounds: bounds) }
//      .preferredColorScheme(.dark)
//  }
//}
