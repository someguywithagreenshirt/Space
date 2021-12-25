//
//  Models.swift
//  Space
//
//  Created by Richard Campbell on 12/24/21.
//

import Foundation

struct Models {
    static var timeBlockDictionary: Dictionary<Int, TimeBlock> = [
        0000: TimeBlock.midnight,
        0030: TimeBlock.twelve_thirty_am,
        0100: TimeBlock.one_am,
        0130: TimeBlock.one_thirty_am,
        0200: TimeBlock.two_am,
        0230: TimeBlock.two_thirty_am,
        0300: TimeBlock.three_am,
        0330: TimeBlock.three_thirty_am,
        0400: TimeBlock.four_am,
        0430: TimeBlock.four_thirty_am,
        0500: TimeBlock.five_am,
        0530: TimeBlock.five_thirty_am,
        0600: TimeBlock.six_am,
        0630: TimeBlock.six_thirty_am,
        0700: TimeBlock.seven_am,
        0730: TimeBlock.seven_thirty_am,
        0800: TimeBlock.eight_am,
        0830: TimeBlock.eight_thirty_am,
        0900: TimeBlock.nine_am,
        0930: TimeBlock.nine_thirty_am,
        1000: TimeBlock.ten_am,
        1030: TimeBlock.ten_thirty_am,
        1100: TimeBlock.eleven_am,
        1130: TimeBlock.eleven_thirty_am,
        1200: TimeBlock.twelve_pm,
        1230: TimeBlock.twelve_thirty_pm,
        1300: TimeBlock.one_pm,
        1330: TimeBlock.one_thirty_pm,
        1400: TimeBlock.two_pm,
        1430: TimeBlock.two_thirty_pm,
        1500: TimeBlock.three_pm,
        1530: TimeBlock.three_thirty_pm,
        1600: TimeBlock.four_pm,
        1630: TimeBlock.four_thirty_pm,
        1700: TimeBlock.five_pm,
        1730: TimeBlock.five_thirty_pm,
        1800: TimeBlock.six_pm,
        1830: TimeBlock.six_thirty_pm,
        1900: TimeBlock.seven_pm,
        1930: TimeBlock.seven_thirty_pm,
        2000: TimeBlock.eight_pm,
        2030: TimeBlock.eight_thirty_pm,
        2100: TimeBlock.nine_pm,
        2130: TimeBlock.nine_thirty_pm,
        2200: TimeBlock.ten_pm,
        2230: TimeBlock.ten_thirty_pm,
        2300: TimeBlock.eleven_pm,
        2330: TimeBlock.eleven_thirty_pm]
}

// MARK: Models.Todo
fileprivate typealias MTodo = Models.Todo
extension Models {
    /// The struct model for all Todo objects.
    ///
    /// - Parameters:
    ///   - title: This will be the big title used in UI.
    ///   May be only viewable item for user to see in UI
    ///   - description: This is a usually hidden free text. User-defined more than anything
    ///   - completed: Default false, marked true by user when done. UI control to hide completed todos
    ///   - creationDate: Set to the Date() of when it is created. Never changed
    ///   - reminderDate: Date/time to remind you about the existence of this todo. Notification Scheduler basically
    ///   - dueDate: Date/time that you will put this todo in a timeline
    ///   - deadlineDate: Date/time it must be completed by or problems. Adding this creates a Nag mechanic
    ///   - completionDate: An array of date/time when completed toggles from false to true
    struct Todo: Identifiable {
        // Free text; most used
        let id = UUID()
        var title: String
        var description: String
        
        // UI Control for TodoView
        var completed: Bool = false
        
        // Potential fields to add
        // Project it belongs to?
        // Checklist?
        // tags?
        
        // Usually hidden
        // TODO: Should the date options be in a time-related struct?
        // Does that make it simpler or does that make it harder to pass info around?
        // For now, I don't think that having all the time information separate buys much
        // But if I want more proactive time management, then it would be helpful
        let creationDate: Date = Date()
        
        // Used to remind you to do it
        var reminderDate: Date?
        
        // Day you plan to actually do it. Meaning card put on timeline
        var dueDate: Date?
        
        // Only set if you need the Nag mechanic to kick in
        var deadlineDate: Date?
        
        // When completed changes it will add to the array
        // this will allow multiple different completions to be tracked
        // in the event that it is completed, and later marked incomplete
        var completionDate: [Date] = []
    }
}

extension MTodo {
    private mutating func completeTodo() {
        if completed == false {
            completed = true
            completionDate.append(Date())
            return
        } else {
            fatalError("You tried making a completed todo, complete again. But for what reason?")
        }
    }
}

extension Models {
    struct Timeline {
        
    }
}

// MARK: Models.TimelineLine
fileprivate typealias MTL_Line = Models.Timeline.Line
extension Models.Timeline {
    struct Line {
        var hoursCovered: Int
        var blocksPerHour: Int = 2 // This makes 30min chunks
        var startHour: TimeBlock
    }
}

extension MTL_Line {
    fileprivate var lastHour: TimeBlock {
        // Make 16 hours 1600
        let ohundredHours = hoursCovered * 10
        
        // Modulo of 2400 should make it so that if time rolls over a certain day it can still track
        let totalTime = (startHour.rawValue + ohundredHours) % 2400
        
        return Models.timeBlockDictionary[totalTime] ?? .midnight
        
    }
}

// MARK: Models. Timeline.Line.HourMarkers
fileprivate typealias MTL_Line_HourMarkers = Models.Timeline.Line.HourMarkers
extension Models.Timeline.Line {
    struct HourMarkers {
        
    }
}

// MARK: Models.Timeline.Expectations - Left
fileprivate typealias MTL_Expectations = Models.Timeline.Expectations
extension Models.Timeline {
    struct Expectations {
        
    }
}


// MARK: Models.Timeline.Reality - Right
fileprivate typealias MTL_Reality = Models.Timeline.Reality
extension Models.Timeline {
    struct Reality {
        
    }
}




// What I want?
// Timeline
// - Line
// - - Labels
// - Expectations
// - Reality
