//
//  PreviewExtensions.swift
//  Space
//
//  Created by Richard Campbell on 12/22/21.
//

import Foundation
import SwiftUI

// MARK: Theme
struct Theme: Identifiable {
    let name: String
    let accentColor: Color
    let secondaryColor: Color
    //let primaryGradient: LinearGradient
    ///let secondaryGradient: LinearGradient
    
    var id: String { name }
    
    static let `default` = Theme(
        name: "Default",
        accentColor: .blue,
        secondaryColor: .orange)
        //primaryGradient: .blueGradient,
        //secondaryGradient: .orangeGradient)
    
    static let web = Theme(
        name: "Web",
        accentColor: .teal,
        secondaryColor: .green)
        //primaryGradient: .tealGradient,
        //secondaryGradient: .greenGradient)
    
        
    static let allThemes: [Theme] = [.default, .web]
    
    static func named(_ name: String) -> Theme? {
        allThemes.first(where: { $0.name == name })
    }
}

// MARK: Theme Environment Keys
struct ThemeKey: EnvironmentKey {
    static let defaultValue = Theme.default
}

extension EnvironmentValues {
    var theme: Theme {
        get { self[ThemeKey.self] }
        set { self[ThemeKey.self] = newValue  }
    }
}

extension String {
    static func name<T>(for type: T) -> String {
        String(reflecting: type)
            .components(separatedBy: ".")
            .last ?? ""
    }
}

extension ColorScheme: Identifiable {
    public var id: String { name }
    
    var name: String {
        switch self {
        case .light: return "Light"
        case .dark: return "Dark"
        @unknown default:
            fatalError()
        }
    }
}

// MARK: Preview Extensions
extension View {
    func previewWithName(_ name: String) -> some View {
        self
            .padding()
            .previewLayout(.sizeThatFits)
            .previewDisplayName(name)
    }
    
    //I need to have two different ways of calling this.
    //One with passing a name, and one without passing anything.
    
    //I want to call .namedPreview() and get the type name, and
    //I want to call .namedPreview() and make that the new name.
    
    //This will work, but could be better I think.
    // TODO: Consider better methods of having multiple interfaces
    func namedPreview(passedName: String? = nil) -> some View {
        let name = String.name(for: type(of: self))
        if let passedName = passedName {
            return previewWithName(passedName)
        } else {
            return previewWithName(name)
        }
    }
    
    func fullScreenPreviews(showAll: Bool = false) -> some View {
        Group {
            if !showAll {
                self
            } else {
                ForEach(Theme.allThemes) { theme in
                    ForEach(ColorScheme.allCases) { colorScheme in
                        self
                            .previewTheme(theme, colorScheme: colorScheme)
                    }
                }
                self
                    .xxxlPreview()
                self
                    .iPhoneSEPreview()
            }
        }
    }
    
    func previewTheme(_ theme: Theme, colorScheme: ColorScheme) -> some View {
        self
            .background(Color(.systemBackground))
            .environment(\.theme, theme)
            .accentColor(theme.accentColor)
            .previewDisplayName(theme.name + ", " + colorScheme.name)
            .environment(\.colorScheme, colorScheme)
    }
    
    func xxxlPreview() -> some View {
        self
            .environment(\.sizeCategory, .accessibilityExtraExtraExtraLarge)
            .previewDisplayName("Accessibility XXXL")
    }
    
    func iPhoneSEPreview() -> some View {
        self
            .previewDevice("iPhone SE (2nd generation)")
            .previewDisplayName("iPhone SE (2nd generation)")
    }
}

