//
//  Date.swift
//

import Foundation

public extension Date {
    func toString(dateFormat: String) -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = dateFormat
        dateFormatter.timeZone = TimeZone.current
        let dateObj = dateFormatter.string(from: self)
        return dateObj
    }
    
    static func stringFromDate(dateString: String) -> String {
        let dateServer = (Date.QHServerFormat().date(from: dateString) ?? Date())
        return dateServer.toString(dateFormat: Date.QHDefaultFormatString())
    }
    
    static func QHDefaultFormatString() -> String {
        return "dd/MM/yyyy"
    }
    
    static func QHDefaultFormat() -> DateFormatter {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = Date.QHDefaultFormatString()
        return dateFormatter
    }
    
    static func QHServerFormatString() -> String {
        return "yyyy-MM-dd'T'HH:mm:ss"
    }
    
    static func QHServerFormat() -> DateFormatter {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = Date.QHServerFormatString()
        return dateFormatter
    }
    
    func postTime() -> String {
        
        if Calendar.current.isDateInYesterday(self) {
            return "Hôm qua"
        }
        
        if Calendar.current.isDateInToday(self) {
            //get time
            var diffInHours = Calendar.current.dateComponents([.hour], from: self, to: Date()).hour
            if diffInHours == nil {diffInHours = 0}
            if diffInHours! > 0 {
                return "\(diffInHours!) h trước"
            } else {
                var diffInMinutes = Calendar.current.dateComponents([.minute], from: self, to: Date()).minute
                
                if diffInMinutes == nil {diffInMinutes = 0}
                if diffInMinutes! > 0 {
                    return "\(diffInMinutes!) m trước"
                }
                
                return "Vừa xong"
            }

        }
    
        return Date.QHDefaultFormat().string(from: self)
    }
}
