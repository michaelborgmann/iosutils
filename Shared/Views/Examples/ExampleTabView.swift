//
//  ExampleTabView.swift
//  SwiftArmyKnife
//
//  Created by Michael Borgmann on 05/06/2022.
//

import SwiftUI

enum SpelledOutOrdinal: String {
    
    case first
    case second
    case third
    case fifth
    case eighth
    case ninth
    case twelfth
    case twentieth
    case thirtieth
    case fortieth
    case fiftieth
    case sixtieth
    case seventieth
    case eightieth
    case ninetieth
    
    static func spellOutOrdinal(_ number: Int) -> String? {
        
        guard var spelled = SpelledOutOrdinal.spellNumber(number) else {
            return nil
        }
        
        switch number {
        case 1: return "first"
        case 2: return "second"
        case 3: return "third"
        case 5: return "fifth"
        case 8: return "eighth"
        case 9: return "ninth"
        case 12: return "twelfth"
        case 20: return "twentieth"
        case 30: return "thirtieth"
        case 40: return "fortieth"
        case 50: return "fiftieth"
        case 60: return "sixtieth"
        case 70: return "seventieth"
        case 80: return "eightieth"
        case 90: return "ninetieth"
        default:
            
            if spelled.contains("one") {
                return spelled.replacingOccurrences(of: "one", with: SpelledOutOrdinal.first.rawValue)
            } else if spelled.contains("two") {
                return spelled.replacingOccurrences(of: "two", with: SpelledOutOrdinal.second.rawValue)
            } else if spelled.contains("three") {
                return spelled.replacingOccurrences(of: "three", with: SpelledOutOrdinal.third.rawValue)
            } else if spelled.contains("five") {
                return spelled.replacingOccurrences(of: "five", with: SpelledOutOrdinal.fifth.rawValue)
            } else if spelled.contains("eight") {
                return spelled.replacingOccurrences(of: "eight", with: SpelledOutOrdinal.eighth.rawValue)
            } else if spelled.contains("nine") {
                return spelled.replacingOccurrences(of: "nine", with: SpelledOutOrdinal.ninth.rawValue)
            }
            
            return spelled + "th"
        }
    }
    
    static func spellNumber(_ number: Int) -> String? {
        let formatter = NumberFormatter()
        formatter.numberStyle = .spellOut
        let spelledOut = formatter.string(from: number as NSNumber)
        return spelledOut
    }
}

struct ExampleTabView: View {
    
    enum IndexDisplayMode: Int {
        case always, automatic, never
        
        var value: PageTabViewStyle.IndexDisplayMode {
            switch self {
            case .always:
                return .always
            case .automatic:
                return .automatic
            case .never:
                return .never
            }
        }
    }
    
    enum BackgroundDisplayMode: Int {
        
        case always, automatic, interactive, never
        
        var value: PageIndexViewStyle.BackgroundDisplayMode {
            switch self {
            case .always:
                return .always
            case .automatic:
                return .automatic
            case .never:
                return .never
            case .interactive:
                return .interactive
            }
        }
    }
    
    @Binding var isPaging: Bool
    @Binding var indexDisplayMode: Int
    @Binding var backgroundDisplayMode: Int
    @Binding var isTextShown: Bool
    @Binding var isImageShown: Bool
    @Binding var numberOfPages: Int
    @Binding var numberOfBadges: Int
    
    var body: some View {
        
        TabView {
            
            ForEach(1...numberOfPages, id: \.self) { index in
                
                let number = SpelledOutOrdinal.spellOutOrdinal(index)
                
                Text("The \(number!.capitalized) Tab")
                    .if(index == 1) { view in
                        view.badge(numberOfBadges)
                    }
                    .tabItem {
                        if isImageShown {
                            Image(systemName: "\(index).square.fill")
                        }
                        
                        if isTextShown {
                            Text(number!.capitalized)
                        }
                    }
                
            }
            
        }.if(isPaging) { view in
            view.tabViewStyle(.page(indexDisplayMode: IndexDisplayMode(rawValue: indexDisplayMode)!.value))
                .indexViewStyle(.page(backgroundDisplayMode:
            BackgroundDisplayMode(rawValue: backgroundDisplayMode)!.value))
        }.if(!isPaging) { view in
            view.indexViewStyle(.page(backgroundDisplayMode:
                                            BackgroundDisplayMode(rawValue: backgroundDisplayMode)!.value))
        }
    }
}

extension ExampleTabView {
    
    struct Sources {
    
        static let example1 = """
TabView {
    Text("The First Tab")
        .badge(10)
        .tabItem {
            Image(systemName: "1.square.fill")
            Text("First")
        }
    Text("Another Tab")
        .tabItem {
            Image(systemName: "2.square.fill")
            Text("Second")
        }
    Text("The Last Tab")
        .tabItem {
            Image(systemName: "3.square.fill")
            Text("Third")
        }
}
"""
        static let example2 = example1 +
"""
.tabViewStyle(.page)
.indexViewStyle(.page(backgroundDisplayMode: .always))
"""
    }
}

struct ExampleTabView_Previews: PreviewProvider {
    static var previews: some View {
        ExampleTabView(isPaging: .constant(false), indexDisplayMode: .constant(0), backgroundDisplayMode: .constant(0), isTextShown: .constant(true), isImageShown: .constant(true), numberOfPages: .constant(3), numberOfBadges: .constant(10))
    }
}

extension View {
    /// Applies the given transform if the given condition evaluates to `true`.
    /// - Parameters:
    ///   - condition: The condition to evaluate.
    ///   - transform: The transform to apply to the source `View`.
    /// - Returns: Either the original `View` or the modified `View` if the condition is `true`.
    @ViewBuilder func `if`<Content: View>(_ condition: Bool, transform: (Self) -> Content) -> some View {
        if condition {
            transform(self)
        } else {
            self
        }
    }
}
