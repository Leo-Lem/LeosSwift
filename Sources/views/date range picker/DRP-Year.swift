////  Created by Leopold Lemmermann on 28.01.22.
//
//import SwiftUI
//
//extension DateRangePicker {
//  struct Year: View {
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
//        ForEach(years, id: \.self) { year in
//          Text("\(format(year))")
//            .tag(tag(year))
//        }
//      }
//    }
//  }
//}
//
//// MARK: - calculations
//
//private extension DateRangePicker.Year {
//  var years: [Int] {
//    let minYear = Calendar.current.component(.year, from: bounds.lowerBound)
//    let maxYear = Calendar.current.component(.year, from: bounds.upperBound)
//
//    let years = Array(minYear ... maxYear)
//    return years
//  }
//
//  func format(_ year: Int) -> String {
//    let comps = DateComponents(year: year),
//        date = Calendar.current.date(from: comps),
//        formatter = DateFormatter(withDateFormat: "yyyy")
//
//    return formatter.string(from: date!)
//  }
//
//  func tag(_ year: Int) -> ClosedRange<Date> {
//    guard
//      let date = DateComponents(year: year).date,
//      let lower = date.startOf(.year),
//      let upper = date.endOf(.year)
//    else { return range }
//
//    let new = (bounds ~= lower ? lower : range.lowerBound) ... (bounds ~= upper ? upper : range.upperBound)
//
//    return new
//  }
//}
//
//// MARK: - Previews
//
//struct DRP_Year_Previews: PreviewProvider {
//  private static let range = Date() - TimeInterval(10, .day) ... Date() + TimeInterval(3, .day)
//  private static let bounds = Date() - TimeInterval(100, .day) ... Date() + TimeInterval(5, .day)
//
//  static var previews: some View {
//    PreviewBinding(range) { DateRangePicker.Year($0, bounds: bounds) }
//      .preferredColorScheme(.dark)
//  }
//}
