//
//  TestData.swift
//  Space
//
//  Created by Richard Campbell on 12/23/21.
//

import Foundation
import SwiftUI

struct TestData {
    static let title = "Todo Title"
    static let description =
        """
        This is what this todo is all about, and how long is this?
        
        And now it is even longer and let's see if this effects it and in what ways.
        """
    static let todo1 = Models.Todo(title: title, description: description)
    static let todo2 = Models.Todo(title: title, description: description)
    static let todo3 = Models.Todo(title: title, description: description)
    static let todo4 = Models.Todo(title: title, description: description)
    static let todo5 = Models.Todo(title: title, description: description)
    static let todoList: [Models.Todo] = [todo1, todo2, todo3, todo4, todo5]
    
    //static let testBlock = IndividualBlock(blockHeight: 73.444444444444442)
    static let testBlock = IndividualBlock(blockWidth: 200, blockHeight: 54.33333333333)
    
    static let realityLine: [IndividualBlock?] = [
        testBlock,
        testBlock,
        testBlock,
        testBlock,
        testBlock,
        testBlock,
        testBlock,
        testBlock,
        testBlock,
        testBlock,
        testBlock,
        testBlock,
        testBlock,
        testBlock,
        testBlock,
        testBlock,
        testBlock,
        testBlock
    ]
    
    // The first Friday in June, 2020:
    // National Donut Day
    // -------------------------------
    static let donutDay2020Components = DateComponents(
      year: 2020,         // We want a date in 2020,
      month: 6,           // in June.
      weekday: 6,         // We want a Friday;
      weekdayOrdinal: 1   // the first one.
    )

    static let donutDay2020 = Calendar.current.date(from: donutDay2020Components)!
    
    static let motherOfAllDemosDateComponents = DateComponents(
      timeZone: TimeZone(identifier: "America/Los_Angeles"),
      year: 1968,
      month: 12,
      day: 9,
      hour: 15,
      minute: 45
    )

    // "\(motherOfAllDemosDate.description(with: Locale(identifier: "en-US")))"
    static let motherOfAllDemosDate = Calendar.current.date(from: motherOfAllDemosDateComponents)!


}
