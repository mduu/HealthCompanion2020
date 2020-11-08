//
//  DateHelper.swift
//  Helsana
//
//  Created by Joanna Piernicka on 05.07.2017.
//  Copyright © 2017 Helsana Versicherungen AG. All rights reserved.
//

import Foundation


struct DateHelper {

    private static let oneDayInSeconds:Double = 86400
    private static let timeZoneZurich = TimeZone(identifier: "Europe/Zurich")
    
    private static let userDataDateFormatter: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss"
        formatter.timeZone = timeZoneZurich
        return formatter
    }()
    
    
    private static let dateTimeFormatter: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss.SSSxxx"
        return formatter
    }()
    
    private static let dateOnlyFormatter: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd"
        return formatter
    }()
    
    private static let swissDateFormatter: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateFormat = "dd.MM.yyyy - HH:mm"
        formatter.timeZone = timeZoneZurich
        formatter.locale = Locale(identifier: "de_CH")
        return formatter
    }()
    
    static func dateOnlyString(from date: Date) -> String {
        return dateOnlyFormatter.string(from: date)
    }
    
    static func addHoursToDate (countHours: Int, date: Date) -> Date {
        return date.addingTimeInterval(TimeInterval(60*60*countHours))
    }
    
    static func ageFromDateOfBirth(_ dateOfBirth: Date) -> Int? {
        let calendar = NSCalendar.current
        let components = calendar.dateComponents([.year], from: dateOfBirth, to: Date())
        
        guard let age = components.year, age >= 0 else {
            return nil
        }
        
        return age
    }
    
    
    static func dateFromDateTimeString(string: String) -> Date? {
        return dateTimeFormatter.date(from: string)
    }
    
    static func stringFromDateTime(date: Date) -> String {
        return dateTimeFormatter.string(from: date)
    }
    
    static func removeTimeStamp(fromDate: Date) -> Date {
        guard let date = Calendar.current.date(from: Calendar.current.dateComponents([.year, .month, .day], from: fromDate)) else {
            fatalError("Failed to strip time from Date object")
        }
        return date
    }
    
    static func getDateOfBirthByAge(_ age: Int) -> Date? {
        guard let dateOfBirth = Calendar.current.date(byAdding: .year, value: -age, to: Date()) else { return nil }
        return dateOfBirth
    }
    
    static func getDefaultDatePickerDate() -> Date? {
        let yearComponent = DateComponents(year: -20)
        let date = Calendar.current.date(byAdding: yearComponent, to: Date())
        return date
    }
    
    static func getStringFromDate(_ date: Date) -> String {
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyyMMdd'T'HHmmss'Z'"
        formatter.timeZone = TimeZone(abbreviation: "UTC")
        formatter.locale = Locale(identifier: "en_US_POSIX")
        return formatter.string(from: date)
    }
    
    static func getLocalTrackerDateAndTimeStringFromDate(_ date: Date) -> String {
        let formatter = DateFormatter()
        formatter.dateFormat = "dd.MM.yyyy, HH:mm"
        formatter.timeZone = timeZoneZurich
        return formatter.string(from: date)
    }
    
    static func getLocalDateStringFromDate(_ date: Date) -> String {
        let formatter = DateFormatter()
        formatter.dateFormat = "dd.MM.yyyy"
        formatter.timeZone = timeZoneZurich
        return formatter.string(from: date)
    }
    
    static func subsctract(days: Int, from date: Date) -> Date? {
        let past = date.addingTimeInterval(-(oneDayInSeconds * Double(days)))
        return setStartOfTheDay(date: past)
    }
    
    static func setStartOfTheDay(date: Date?) -> Date? {
        guard let date = date else { return nil }
        return Calendar.current.date(bySettingHour: 0, minute: 0, second: 0, of: date)
    }
    
    static func setEndOfTheDay(date: Date?) -> Date? {
        guard let date = date else { return nil }
        return Calendar.current.date(bySettingHour: 23, minute: 59, second: 59, of: date)
    }
    
    static func secondsToDaysHoursMinutesSeconds(seconds: TimeInterval) -> (Int, Int, Int, Int) {
        let days = Int(seconds/86400)
        let hours = Int(seconds.truncatingRemainder(dividingBy: 86400)/3600)
        let minutes = Int(seconds.truncatingRemainder(dividingBy: 3600)/60)
        let seconds = Int(seconds.truncatingRemainder(dividingBy: 60))
        return (days, hours, minutes, seconds)
    }
    
    static func getLastYear() -> Int {
        let year = getCurrentYear()
        return year-1
    }
    
    static func getNextYear() -> Int {
        let year = getCurrentYear()
        return year+1
    }
    
    static func getDateFromISO8601String(_ dateString: String?) -> Date? {
        guard let dateString = dateString else { return nil}
        let value = dateString.replacingOccurrences(of: "\\.\\d+", with: "", options: .regularExpression).replacingOccurrences(of: "Z", with: "")
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss"
        guard let date = formatter.date(from: value) else { return nil }
        return date
    }
    
    static func getCurrentYear() -> Int {
        let date = Date()
        let calendar = Calendar.current
        let year = calendar.component(.year, from: date)
        return year
    }
    
    static func isToday(_ date: Date) -> Bool {
        let calendar = Calendar.current
        return calendar.isDateInToday(date)
    }
    
    static func isYesterday(_ date: Date) -> Bool {
        let calendar = Calendar.current
        return calendar.isDateInYesterday(date)
    }
    
    static func getDateStringFromISO8601String(dateString: String?) -> String? {
        guard let value = dateString else { return nil }
        return userDataDateFormatter.string(for: value)
    }
    
    static func getSwissTimeForDate(date: Date) -> String {
        return swissDateFormatter.string(from: date)
    }
    
    static func getSwissDateForUTC(date: Date) -> Date? {
        return swissDateFormatter.date(from: getSwissTimeForDate(date: date))
    }
}
