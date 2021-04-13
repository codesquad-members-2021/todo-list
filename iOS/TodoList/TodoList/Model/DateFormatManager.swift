import Foundation

class DateFormatManager {
    
    
    static func formatDateToString(_ date: Date) -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd"
        return dateFormatter.string(from: date)
    }
    
    static func setUpMinDateRange() -> Date {
        let date = Date()
        return Calendar.current.date(byAdding: .year, value: -100, to: date)!
    }
    
    static func setUpMaxDateRagne() -> Date {
        let date = Date()
        return Calendar.current.date(byAdding: .year, value: -15, to: date)!
    }
}
