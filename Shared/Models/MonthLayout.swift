//
//  MonthLayout.swift
//  Space
//
//  Created by Richard Campbell on 12/31/21.
//

import Foundation

struct MonthLayout {
    let date: Date
    let weekBlock: Bool = true
    
    var monthLayout = { createMonthBlocks(date: Date()) }
    
    var firstWeekdayOfMonth: Int {
        guard let unwrapped = Calendar.current.dateComponents([.weekday], from: date).weekday else {
            fatalError("There always should be a first weekday of the month")
        }
        return unwrapped
    }
    
    var daysInMonth: Int {
        guard let unwrapped = Calendar.current.range(of: .day, in: .month, for: date)?.count else {
            fatalError("There always should be days in a month")
        }
        
        return unwrapped
    }
    
    var yearOfMonth: Int {
        guard let unwrapped = Calendar.current.dateComponents([.year], from: date).year else {
            fatalError("Every month should always have a year")
        }
        return unwrapped
    }
}

extension MonthLayout {
    
    init(_ date: Date) {
        self.date = date
    }
}

enum MonthBlock: String {
    
    case weekNumber
    case dayOfWeek
    case blank
}

struct MonthBlockInfo: Identifiable, Hashable {
    let id = UUID()
    let caseEnum: MonthBlock
}

extension MonthBlockInfo {
    init (_ caseEnum: MonthBlock) {
        self.caseEnum = caseEnum
    }
}

func createMonthBlocks (date: Date) -> [MonthBlockInfo] {
    let monthLayout = MonthLayout(date)
    
    var monthArray: [MonthBlockInfo] = (0..<monthLayout.daysInMonth).map { _ in MonthBlockInfo(.dayOfWeek) }
    
    for _ in 0..<monthLayout.firstWeekdayOfMonth {
        monthArray.insert(MonthBlockInfo(.blank), at: 0)
    }
    
    
    
    if monthLayout.weekBlock {
        monthArray.insert(MonthBlockInfo(.weekNumber), at: 0)
        monthArray.insert(MonthBlockInfo(.weekNumber), at: 8)
        monthArray.insert(MonthBlockInfo(.weekNumber), at: 16)
        monthArray.insert(MonthBlockInfo(.weekNumber), at: 24)
    }
    
    return monthArray
}

