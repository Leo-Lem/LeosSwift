////  Created by Leopold Lemmermann on 28.01.22.
//
//import SwiftUI
//
//extension DateRangePicker {
//  struct Day: View {
//    let month: Date
//    @Binding var selection: (range: ClosedRange<Date>, bounds: ClosedRange<Date>)
//
//    init(_ range: Binding<ClosedRange<Date>>, bounds: ClosedRange<Date>, current month: Date) {
//      _selection = Binding {
//        (
//          range.wrappedValue.lowerBound,
//          range.wrappedValue.upperBound,
//          bounds.lowerBound,
//          bounds.upperBound
//        )
//      } set: { newValue in
//        range = newValue.lower ... newValue.upper
//      }
//      self.month = month
//    }
//
//    var body: some View {
//      LazyVGrid(columns: Array(
//        repeating: GridItem(spacing: 5),
//        count: 7
//      ), spacing: 5) {
//        ForEach(Calendar.current.shortWeekdaySymbols, id: \.self) { weekdayView($0) }
//        ForEach(0 ..< firstDay - 1, id: \.self) { _ in Spacer() }
//        ForEach(days, id: \.self) { dayView($0) }
//      }
//    }
//  }
//}
//
//// MARK: - UI
//
//private extension DateRangePicker.Day {
//  func weekdayView(_ weekday: String) -> some View {
//    Text(weekday)
//      .textCase(.uppercase)
//      .font(.caption)
//      .foregroundColor(.primary)
//  }
//
//  func dayView(_ day: Date) -> some View {
//    var color: Color {
//      switch day {
//      case selection.range.lowerBound, selection.range.upperBound:
//        return day.isInToday() ? .blue : .blue.opacity(0.75)
//      case selection.range:
//        return day.isInToday() ? .blue.opacity(0.5) : .blue.opacity(0.25)
//      default:
//        return day.isInToday() ? .gray : .clear
//      }
//    }
//
//    return Text("\(Calendar.current.component(.day, from: day))")
//      .font(.headline)
//      .fontWeight(.medium)
//      .frame(width: 30, height: 30)
//      .aspectRatio(1, contentMode: .fit)
//      .background {
//        Circle()
//          .foregroundColor(color)
//      }
//      .onTapGesture { setRange(day) }
//      .disabled(!(selection.bounds ~= day), colors: (.primary, .secondary))
//  }
//}
//
//// MARK: - calculations
//
//private extension DateRangePicker.Day {
//  var days: [Date] { (month.enumerate(in: .month) ?? []).map { $0.startOf(.day) ?? $0 } }
//  var firstDay: Int { Calendar.current.component(.weekday, from: days.first!) }
//
//  func setRange(_ day: Date) {
//    let lower = selection.range.lowerBound, upper = selection.range.upperBound
//    let mid = lower + (lower.distance(to: upper, unit: .second) ?? 0) / 2
//    switch day {
//    case ..<mid: selection.range = day ... upper
//    case mid...: selection.range = lower ... day
//    default: break
//    }
//  }
//}
//
//// MARK: - Previews
//
//struct DateRangePicker_Day_Previews: PreviewProvider {
//  private static let range = (Date() - TimeInterval(6, .day)).startOf(.day)! ... (Date() + TimeInterval(3, .day))
//    .startOf(.day)!
//  private static let bounds = (Date() - TimeInterval(100, .day)).startOf(.day)! ... (Date() + TimeInterval(5, .day))
//    .startOf(.day)!
//
//  static var previews: some View {
//    PreviewBinding(range) {
//      DateRangePicker.Day($0, bounds: bounds, current: Date())
//    }
//    .preferredColorScheme(.dark)
//  }
//}
