//
//  ExampleTabView.swift
//  SwiftArmyKnife
//
//  Created by Michael Borgmann on 05/06/2022.
//

import SwiftUI
import CodeEditor

struct ContainerView: View {
    
    let spelledOutOrdinal: String?
    @Binding var tabBarHeight: CGFloat
    @Binding var tabBarColor: Color
    
    var body: some View {
        
        VStack {
            
            let number = spelledOutOrdinal ?? "#"
            
            Text("The \(number.capitalized) Tab")

            Rectangle()
                .fill(Color.clear)
                .frame(height: tabBarHeight)
                .background(tabBarColor)
        }
    }
}

struct BackgroundColor: View {
    
    @Binding var isSafeAreaIgnored: Bool
    @Binding var backgroundColor: Color
    
    var body: some View {
        
        if isSafeAreaIgnored {
            backgroundColor.ignoresSafeArea()
        } else {
            backgroundColor
        }
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
        
        var string: String {
            switch self {
            case .always:
                return ".always"
            case .automatic:
                return ".automatic"
            case .never:
                return ".never"
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
        
        var string: String {
            switch self {
            case .always:
                return ".always"
            case .automatic:
                return ".automatic"
            case .never:
                return ".never"
            case .interactive:
                return ".interactive"
            }
        }
    }
    
    @Binding var isPaging: Bool
    @Binding var indexDisplayMode: Int
    @Binding var backgroundDisplayMode: Int
    @Binding var isTextShown: Bool
    @Binding var isImageShown: Bool
    @Binding var numberOfPages: Int
    @Binding var numberOfBadges: Double
    @Binding var accentColor: Color
    @Binding var backgroundColor: Color
    @Binding var isSafeAreaIgnored: Bool
    @Binding var tabBarHeight: CGFloat
    @Binding var tabBarColor: Color
    
    var body: some View {
        
        TabView {

            ForEach(1...numberOfPages, id: \.self) { index in
                
                let number = index.spellOutOrdinal
                
                ZStack {
                    
                    BackgroundColor(isSafeAreaIgnored: $isSafeAreaIgnored, backgroundColor: $backgroundColor)
                    
                    ContainerView(spelledOutOrdinal: number, tabBarHeight: $tabBarHeight, tabBarColor: $tabBarColor)
                }
                .if(index == 1) { view in
                    view.badge(Int(numberOfBadges))
                }
                .tabItem {
                    if isImageShown {
                        Image(systemName: "\(index).square.fill")
                            .renderingMode(.template)
                    }

                    if isTextShown {
                        Text(number!.capitalized)
                    }
                }
            }
        }
        .accentColor(accentColor)
        .if(isPaging) { view in
            view.tabViewStyle(.page(indexDisplayMode: IndexDisplayMode(rawValue: indexDisplayMode)!.value))
                .indexViewStyle(.page(backgroundDisplayMode:
            BackgroundDisplayMode(rawValue: backgroundDisplayMode)!.value))
        }
    }
}

struct ExampleTabView_Previews: PreviewProvider {
    static var previews: some View {
        
        ExampleTabView(
            isPaging: .constant(true),
            indexDisplayMode: .constant(ExampleTabView.IndexDisplayMode.always.rawValue),
            backgroundDisplayMode: .constant(ExampleTabView.BackgroundDisplayMode.always.rawValue),
            isTextShown: .constant(true),
            isImageShown: .constant(true),
            numberOfPages: .constant(1),
            numberOfBadges: .constant(5),
            accentColor: .constant(.red),
            backgroundColor: .constant(.green.opacity(0.3)),
            isSafeAreaIgnored: .constant(true),
            tabBarHeight: .constant(10),
            tabBarColor: .constant(.clear.opacity(0.3))
        )
        .previewInterfaceOrientation(.landscapeLeft)
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

extension String {
    
    var lines: [String] {
        components(separatedBy: "\n")
    }
    
    var indent: String {
        lines.map { "    \($0)" }.joined(separator: "\n")
    }
    
//    var undent: String {}
}

extension Color {
    
    var rgba: (red: Double, green: Double, blue: Double, alpha: Double) {
        
        var red: CGFloat = 0
        var green: CGFloat = 0
        var blue: CGFloat = 0
        var alpha: CGFloat = 0
        
        let uiColor = UIColor(self)
        
        uiColor.getRed(&red, green: &green, blue: &blue, alpha: &alpha)
        
        return (red, green, blue, alpha)
    }
}
