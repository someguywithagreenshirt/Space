//
//  DateExtensions.swift
//  Space
//
//  Created by Richard Campbell on 12/31/21.
//

import Foundation



// Overloading + and - so that we can add and subtract DateComponents
// ==================================================================

func +(_ lhs: DateComponents, _ rhs: DateComponents) -> DateComponents {
  return combineComponents(lhs, rhs)
}

func -(_ lhs: DateComponents, _ rhs: DateComponents) -> DateComponents {
  return combineComponents(lhs, rhs, multiplier: -1)
}

func combineComponents(_ lhs: DateComponents,
                       _ rhs: DateComponents,
                       multiplier: Int = 1)
  -> DateComponents {
    var result = DateComponents()
    result.nanosecond = (lhs.nanosecond ?? 0) + (rhs.nanosecond ?? 0) * multiplier
    result.second     = (lhs.second     ?? 0) + (rhs.second     ?? 0) * multiplier
    result.minute     = (lhs.minute     ?? 0) + (rhs.minute     ?? 0) * multiplier
    result.hour       = (lhs.hour       ?? 0) + (rhs.hour       ?? 0) * multiplier
    result.day        = (lhs.day        ?? 0) + (rhs.day        ?? 0) * multiplier
    result.weekOfYear = (lhs.weekOfYear ?? 0) + (rhs.weekOfYear ?? 0) * multiplier
    result.month      = (lhs.month      ?? 0) + (rhs.month      ?? 0) * multiplier
    result.year       = (lhs.year       ?? 0) + (rhs.year       ?? 0) * multiplier
    return result
}

// Overloading - so that we can negate DateComponents
// --------------------------------------------------

// We'll need to overload unary - so we can negate components
prefix func -(components: DateComponents) -> DateComponents {
  var result = DateComponents()
  if components.nanosecond != nil { result.nanosecond = -components.nanosecond! }
  if components.second     != nil { result.second     = -components.second! }
  if components.minute     != nil { result.minute     = -components.minute! }
  if components.hour       != nil { result.hour       = -components.hour! }
  if components.day        != nil { result.day        = -components.day! }
  if components.weekOfYear != nil { result.weekOfYear = -components.weekOfYear! }
  if components.month      != nil { result.month      = -components.month! }
  if components.year       != nil { result.year       = -components.year! }
  return result
}

// Overloading + and - so that we can add Dates and DateComponents
// and subtract DateComponents from Dates

// Date + DateComponents
func +(_ lhs: Date, _ rhs: DateComponents) -> Date
{
  return Calendar.current.date(byAdding: rhs, to: lhs)!
}

// DateComponents + Dates
func +(_ lhs: DateComponents, _ rhs: Date) -> Date
{
  return rhs + lhs
}

// Date - DateComponents
func -(_ lhs: Date, _ rhs: DateComponents) -> Date
{
  return lhs + (-rhs)
}

// Extending Date so that creating dates and debugging are simpler
// ===============================================================

extension Date {

  init(year: Int,
       month: Int,
       day: Int,
       hour: Int = 0,
       minute: Int = 0,
       second: Int = 0,
       timeZone: TimeZone = TimeZone(abbreviation: "UTC")!) {
    var components = DateComponents()
    components.year = year
    components.month = month
    components.day = day
    components.hour = hour
    components.minute = minute
    components.second = second
    components.timeZone = timeZone
    self = Calendar.current.date(from: components)!
  }

  init(dateString: String) {
    let formatter = DateFormatter()
    formatter.dateFormat = "yyyy-MM-dd HH:mm:ss zz"
    self = formatter.date(from: dateString)!
  }

  var desc: String {
    get {
      let PREFERRED_LOCALE = "en_US" // Use whatever locale you prefer!
      return self.description(with: Locale(identifier: PREFERRED_LOCALE))
    }
  }

}

// Overloading - so that we can use it to find the difference
// between two Dates
// ==========================================================

func -(_ lhs: Date, _ rhs: Date) -> DateComponents
{
  return Calendar.current.dateComponents(
    [.year, .month, .weekOfYear, .day, .hour, .minute, .second, .nanosecond],
    from: rhs,
    to: lhs)
}

// Extending Int to add some syntactic magic to date components
// ============================================================

extension Int {

  var second: DateComponents {
    var components = DateComponents()
    components.second = self;
    return components
  }

  var seconds: DateComponents {
    return self.second
  }

  var minute: DateComponents {
    var components = DateComponents()
    components.minute = self;
    return components
  }

  var minutes: DateComponents {
    return self.minute
  }

  var hour: DateComponents {
    var components = DateComponents()
    components.hour = self;
    return components
  }

  var hours: DateComponents {
    return self.hour
  }

  var day: DateComponents {
    var components = DateComponents()
    components.day = self;
    return components
  }

  var days: DateComponents {
    return self.day
  }

  var week: DateComponents {
    var components = DateComponents()
    components.weekOfYear = self;
    return components
  }

  var weeks: DateComponents {
    return self.week
  }

  var month: DateComponents {
    var components = DateComponents()
    components.month = self;
    return components
  }

  var months: DateComponents {
    return self.month
  }

  var year: DateComponents {
    var components = DateComponents()
    components.year = self;
    return components
  }

  var years: DateComponents {
    return self.year
  }

}

// Extending DateComponents to add even more syntactic magic: fromNow and ago
// ==========================================================================

extension DateComponents {

  var fromNow: Date {
    return Calendar.current.date(byAdding: self,
                                 to: Date())!
  }

  var ago: Date {
    return Calendar.current.date(byAdding: -self,
                                 to: Date())!
  }

}

//=====================================
//
//     MARK: - Only Comments Below Here
//
//=====================================

//var timeInterval = DateComponents(
//  month: 2,
//  day: 3,
//  hour: 4,
//  minute: 5,
//  second: 6
//)
//let futureDate = Calendar.current.date(byAdding: timeInterval, to: Date())!
//print("2 months, 3 days, 4 hours, 5 minutes, and 6 seconds from now is \(futureDate.description(with: Locale(identifier: "en_US"))).")



// Let's define a couple of durations of time
// ------------------------------------------

//var oneDayFiveHoursTenMinutes = DateComponents(
//  day: 1,
//  hour: 5,
//  minute: 10
//)
//var threeDaysTenHoursThirtyMinutes = DateComponents(
//  day: 3,
//  hour: 10,
//  minute: 30
//)


// Now let's add and subtract them
// -------------------------------

//let additionResult = oneDayFiveHoursTenMinutes + threeDaysTenHoursThirtyMinutes
//print("1 day, 5 hours, and 10 minutes + 3 days, 10 hours, and 30 minutes equals:")
//print("\(additionResult.day!) days, \(additionResult.hour!) hours, and \(additionResult.minute!) minutes.")

//let subtractionResult = threeDaysTenHoursThirtyMinutes - oneDayFiveHoursTenMinutes
//print("1 day, 5 hours, and 10 minutes - 3 days, 10 hours, and 30 minutes equals:")
//print("\(subtractionResult.day!) days, \(subtractionResult.hour!) hours, and \(subtractionResult.minute!) minutes.")





//let negativeTime = -oneDayFiveHoursTenMinutes
//print("Negating 1 day, 5 hours, and 10 minutes turns it into:")
//print("\(negativeTime.day!) days, \(negativeTime.hour!) hours, and \(negativeTime.minute!) minutes.")





// What time will it be 1 day, 5 hours, and 10 minutes from now?
// -------------------------------------------------------------

// Here's the standard way of finding out:
//let futureDate0 = Calendar.current.date(
//  byAdding: oneDayFiveHoursTenMinutes,
//  to: Date()
//)

// With our overloads and function definitions, we can now do it this way:
//let futureDate1 = Date() + oneDayFiveHoursTenMinutes
//print("Date() + oneDayFiveHoursTenMinutes = \(futureDate1.description(with: Locale(identifier: "en_US")))")

// This will work as well:
//let futureDate2 = oneDayFiveHoursTenMinutes + Date()
//print("oneDayFiveHoursTenMinutes + Date() = \(futureDate2.description(with: Locale(identifier: "en_US")))")


// What time was it 3 days, 10 hours, and 30 minutes ago?
// ------------------------------------------------------

// Doing it the standard way takes some work
//var minus3Days5Hours30minutes = threeDaysTenHoursThirtyMinutes
//minus3Days5Hours30minutes.day = -threeDaysTenHoursThirtyMinutes.day!
//minus3Days5Hours30minutes.hour = -threeDaysTenHoursThirtyMinutes.hour!
//minus3Days5Hours30minutes.minute = -threeDaysTenHoursThirtyMinutes.minute!
//let pastDate0 = Calendar.current.date(byAdding: minus3Days5Hours30minutes, to: Date())

// With our overloads and function definitions, it's so much easier:
//let pastDate1 = Date() - threeDaysTenHoursThirtyMinutes
//print("Date() - threeDaysTenHoursThirtyMinutes = \(pastDate1.description(with: Locale(identifier: "en_US")))")





// The Stevenote where the original iPhone was announced took place
// on January 9, 2007 at 10:00 a.m. PST
//let iPhoneStevenoteDate = Date(year: 2007,
//                               month: 1,
//                               day: 9,
//                               hour: 10,
//                               minute: 0,
//                               second: 0,
//                               timeZone: TimeZone(abbreviation: "PST")!)
////print("iPhoneStevenoteDate: \(iPhoneStevenoteDate.desc)")

// The original iPhone went on sale on June 27, 2007
//let iPhoneReleaseDate = Date(year: 2007, month: 6, day: 27) // June 27, 2007, 00:00:00 UTC
//print("iPhoneReleaseDate: \(iPhoneReleaseDate.desc)")

// The Stevenote where the original iPad was announced took place
// on January 27, 2010 at 10:00 a.m. PST
//let iPadStevenoteDate = Date(dateString: "2010-01-27 10:00:00 PST")
//print("iPadStevenoteDate: \(iPadStevenoteDate.desc)")



// How long was it between the announcement of the original iPhone
// and its release in the stores?
//let iPhoneWait = iPhoneReleaseDate - iPhoneStevenoteDate
//print("The first iPhone users had to wait this long: ")
//print("\(iPhoneWait.year!) years, " +
//  "\(iPhoneWait.month!) months, " +
//  "\(iPhoneWait.weekOfYear!) weeks, " +
//  "\(iPhoneWait.day!) days, " +
//  "\(iPhoneWait.hour!) hours, and " +
//  "\(iPhoneWait.minute!) minutes.")

// How long ago was the first moon landing, which took place
// on July 20, 1969, 20:18 UTC?
//let timeSinceMoonLanding = Date() - Date(dateString: "1969-07-20 20:18:00 UTC")
//print("It’s been this long since the first moon landing: ")
//print("\(timeSinceMoonLanding.year!) years, " +
//  "\(timeSinceMoonLanding.month!) months, " +
//  "\(timeSinceMoonLanding.weekOfYear!) weeks, " +
//  "\(timeSinceMoonLanding.day!) days, " +
//  "\(timeSinceMoonLanding.hour!) hours, and " +
//  "\(timeSinceMoonLanding.minute!) minutes.")




// A quick test of some future dates
//print("One hour from now is: \((Date() + 1.hour).desc)")
//print("One day from now is: \((Date() + 1.day).desc)")
//print("One week from now is: \((Date() + 1.week).desc)")
//print("One month from now is: \((Date() + 1.month).desc)")
//print("One year from now is: \((Date() + 1.year).desc)")

// What was the date 10 years, 9 months, 8 days, 7 hours, and 6 minutes ago?
//let aLittleWhileBack = Date() - 10.years - 9.months - 8.days - 7.hours - 6.minutes
//print("10 years, 9 months, 8 days, 7 hours, and 6 minutes ago, it was: \(aLittleWhileBack.desc)")




// We’re now in Serious Syntax Magic Land!
// ---------------------------------------

//print("2.weeks.fromNow: \(2.weeks.fromNow.desc)")
//print("3.months.fromNow: \(3.months.fromNow.desc)")

//let futureDate3 = (2.months + 3.days + 4.hours + 5.minutes + 6.seconds).fromNow
//print("futureDate3: \(futureDate3.desc)")

//let pastDate2 = (2.months + 3.days + 4.hours + 5.minutes + 6.seconds).ago
//print("pastDate2: \(pastDate2.desc)")
