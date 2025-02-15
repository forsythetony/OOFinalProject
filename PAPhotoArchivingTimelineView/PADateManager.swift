//
//  PADateManager.swift
//  PAPhotoArchivingTimelineView
//
//  Created by Tony Forsythe on 10/26/16.
//  Copyright © 2016 Tony Forsythe. All rights reserved.
//

import UIKit

enum PADateStyleType : String {
    case Pretty = "EEE, dd MMM yyy"
    case Firebase = "yyyy-MM-dd"
    case TimeOnly = "H:m:S"
    case FirebaseFull = "yyyy-MM-dd H:m:S"
}
class PADateManager {
    
    static let sharedInstance = PADateManager.init()
    
    private let formatter = DateFormatter()
    
    private let currentCalendar = Calendar(identifier: Calendar.Identifier.gregorian)
    
    
    func getDateFromString( str : String, formatType : PADateStyleType ) -> Date {
        
        formatter.dateFormat = formatType.rawValue
        
        if let dt = formatter.date(from: str) {
            return dt
        }
        else {
            return Date()
        }
    }
    func getDateString( date : Date, formatType type : PADateStyleType ) -> String {
        
        var dateString = ""
        
        formatter.dateFormat = type.rawValue
        
        return formatter.string(from: date)
    }
    
    func getLowerYearBound( year : Date ) -> Date {
    
        let yearInt = self.getLowerYearBoundInt(year: year)
        
        return self.getDateFromYearInt(year: yearInt)
    }
    
    func getLowerYearBoundInt( year : Date ) -> Int {
        
        let incrementValue = Constants.Timeline.YearBoundIncrement
        
        var yearInt = self.getYearIntValue(date: year)
        
        if yearInt % incrementValue == 0 {
            return yearInt - incrementValue
        }
        
        while (yearInt % incrementValue != 0) {
            yearInt = yearInt - 1
        }
        
        return yearInt
    }
    
    
    func getSecondsFromDistantPast( date : Date ) -> TimeInterval {
        
        let interval = date.timeIntervalSince(Date.distantPast)
        
        return interval
    }
    
    func getUpperYearBound( year : Date ) -> Date {
        
        let yearInt = self.getUpperYearBoundInt(year: year)
        
        return self.getDateFromYearInt(year: yearInt)
    }
    func getUpperYearBoundInt( year : Date ) -> Int {
        
        let incrementValue = Constants.Timeline.YearBoundIncrement
        
        var yearInt = self.getYearIntValue(date: year)
        
        let currYearInt = self.getCurrentYearInt()
        
        if (yearInt % incrementValue == 0) {
            let newYearInt = yearInt + incrementValue
            
            return min(currYearInt, newYearInt)
        }
        
        while( yearInt % incrementValue != 0 && yearInt != currYearInt) {
            yearInt = yearInt + 1
        }
        
        return yearInt
    }
    
    func getDateSpanSeconds( startDate : Date, endDate : Date ) -> TimeInterval {
        
        let startRef    = self.getSecondsFromDistantPast(date: startDate)
        let endRef      = self.getSecondsFromDistantPast(date: endDate)

        let diff = endRef - startRef
        
        return abs( diff )
    }
    
    
    
    
    
    
    
    
    
    
    
    
    
    func getCurrentYearInt() -> Int {
        
        return self.getYearIntValue(date: Date())
    }
    func getDateFromYearInt( year : Int ) -> Date {
        
        var dateComps = DateComponents()
        dateComps.year = year
        dateComps.month = 1
        dateComps.day = 1
        
        if let newDate = currentCalendar.date(from: dateComps) {
            return newDate
        }
        
        return Date()
    }
    
    func getYearIntValue( date : Date ) -> Int {
        
        let yearVal = currentCalendar.component(.year, from: date)
        
        return yearVal
    }
    
    func randomDateBetweenYears( startYear: Date, endYear : Date ) -> Date {
        
        let startYearRef = self.getSecondsFromDistantPast(date: startYear)
        let endYearRef = self.getSecondsFromDistantPast(date: endYear)
        
        let randomDoubleInSpan = PARandom.randomDoubleInSpan(start: Double(startYearRef), end: Double(endYearRef))
        
        let newDate = Date(timeInterval: TimeInterval(randomDoubleInSpan), since: Date.distantPast)
        
        return newDate
    }
    
    func randomDateBetweenYears( startYear : Int, endYear : Int) -> Date {
        
        let firstDate = self.getDateFromYearInt(year: startYear)
        let lastDate = self.getDateFromYearInt(year: endYear)
        
        return self.randomDateBetweenYears(startYear: firstDate, endYear: lastDate)
    }
    
    func getDateFromTimeIntervalSinceDistantPast( interval : TimeInterval ) -> Date {
        
        let newDate = Date(timeInterval: interval, since: Date.distantPast)
        
        return newDate
    }
    
}


class PANumberManager {
    

}
