//
//  ViewType.swift
//  Space
//
//  Created by Richard Campbell on 12/22/21.
//

import Foundation
import SwiftUI

#warning("Really need to restrict this to a View only")
protocol ViewTypeProtocol {
    var viewType: ViewType { get set }
}

enum ViewType: CaseIterable {
    case card
    case fullscreen
    case ghost
    case timeline
}
