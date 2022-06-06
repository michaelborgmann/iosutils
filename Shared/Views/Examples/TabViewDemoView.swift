//
//  ExampleTabView.swift
//  SwiftArmyKnife
//
//  Created by Michael Borgmann on 05/06/2022.
//

import SwiftUI

struct SheetView: View {
    @Environment(\.dismiss) var dismiss

    var body: some View {
        Button("Press to dismiss") {
            dismiss()
        }
        .font(.title)
        .padding()
        .background(.black)
    }
}

struct TabViewDemoView: View {
    
    let component: ComponentModel
    @State private var showingSheet = false
    @State private var isCodeSheetShown = false
    @State private var isPaging = false
    @State private var indexDisplayMode = 0
    @State private var backgroundDisplayMode = 0
    @State private var isTextShown = true
    @State private var isImageShown = true
    @State private var numberOfPages = 3
    @State private var numberOfBadges = 10.0
    @State private var accentColor = Color.accentColor
    @State private var backgroundColor = Color.clear
    @State private var isSafeAreaIgnored = true
    @State private var tabBarColor = Color.clear
    @State private var tabBarHeight: CGFloat = 10
    
    var body: some View {
        
        VStack {
            
            ScrollView {
                
                Group {
                    Stepper(value: $numberOfPages, in: 1...100) {
                        Text("Number of Pages: \(numberOfPages)")
                    }.padding()
                    
                    Toggle(isOn: $isPaging) {
                        Text("View Style: Paging")
                    }
                    .padding()
                }
                
                Group {
                    ColorPicker("Tab item accent color", selection: $accentColor)
                        .padding()
                    
                    ColorPicker("Background color", selection: $backgroundColor)
                        .padding()
                    
                    Toggle(isOn: $isSafeAreaIgnored) {
                        Text("Ignore Safe Area for background")
                    }
                    .padding()
                
                    ColorPicker("TabView color", selection: $tabBarColor)
                            .padding()
                    
                    Stepper(value: $tabBarHeight, in: 0...100) {
                        Text("TabView height: \(Int(tabBarHeight))")
                    }.padding()
                }
                
                Group {
                    VStack(alignment: .leading, spacing: 6) {
                        Text("PageTabViewStyle.IndexDisplayMode").padding([.leading, .trailing])
                        Picker("PageTabViewStyle.IndexDisplayMode", selection: $indexDisplayMode) {
                            Text("always").tag(0)
                            Text("automatic").tag(1)
                            Text("never").tag(2)
                        }
                        .pickerStyle(.segmented)
                        .padding([.leading, .trailing])
                    }.padding([.bottom])
                    
                    VStack(alignment: .leading, spacing: 6) {
                        Text("PageTabViewStyle.IndexDisplayMode").padding([.leading, .trailing])
                        Picker("PageTabViewStyle.IndexDisplayMode", selection: $backgroundDisplayMode) {
                            
                            Text("always").tag(0)
                            Text("automatic").tag(1)
                            Text("interactive").tag(2)
                            Text("never").tag(3)
                        }
                        .pickerStyle(.segmented)
                        .padding([.leading, .trailing])
                    }
                }
                
                Group {
                    Toggle(isOn: $isTextShown) {
                        Text("Tab Item: Show Text")
                    }
                    .padding()
                    
                    Toggle(isOn: $isImageShown) {
                        Text("Tab Item: Show Image")
                    }
                    .padding()
                    
                    VStack(spacing: 0) {
                        
                        Text("Number of Badges: \(Int(numberOfBadges))")
                        
                        Slider(
                            value: $numberOfBadges,
                            in: 0...100,
                            step: 1
                        ) {
                            Text("Speed")
                        } minimumValueLabel: {
                            Text("0")
                        } maximumValueLabel: {
                            Text("100")
                        }
                    }.padding()
                }
            }
            .background(Color.white
                .shadow(color: .black, radius: 2, x: 0, y:5).opacity(0.1)
            )
            
            Spacer()
            
            HStack {
                ExampleTabView(isPaging: $isPaging, indexDisplayMode: $indexDisplayMode, backgroundDisplayMode: $backgroundDisplayMode, isTextShown: $isTextShown, isImageShown: $isImageShown, numberOfPages: $numberOfPages, numberOfBadges: $numberOfBadges, accentColor: $accentColor, backgroundColor: $backgroundColor, isSafeAreaIgnored: $isSafeAreaIgnored, tabBarHeight: $tabBarHeight, tabBarColor: $tabBarColor)
                    .frame(height: 150)
                    .padding()
            }
            .background(Color.white
                .shadow(color: .black, radius: 2, x: 0, y:5).opacity(0.1)
            )
            
        }.toolbar {
            ToolbarItem(placement: .navigationBarTrailing) {

                Button(action: { isCodeSheetShown.toggle() }) {
                    Image(systemName: "curlybraces")
                }.sheet(isPresented: $isCodeSheetShown) {
                    
                    let source = Sources(
                        numberOfPages: $numberOfPages,
                        numberOfBadges: $numberOfBadges,
                        isPaging: $isPaging,
                        indexDisplayMode: $indexDisplayMode,
                        backgroundDisplayMode: $backgroundDisplayMode,
                        isTextShown: $isTextShown,
                        isImageShown: $isImageShown,
                        accentColor: $accentColor,
                        backgroundColor: $backgroundColor,
                        isSafeAreaIgnored: $isSafeAreaIgnored,
                        tabBarHeight: $tabBarHeight,
                        tabBarColor: $tabBarColor
                    )
                    
                    SourceCodeView(source: .constant(source.code))
                }
            }
        }
    }
}

extension TabViewDemoView {
    
    struct Sources {
        
        @Binding var numberOfPages: Int
        @Binding var numberOfBadges: Double
        @Binding var isPaging: Bool
        @Binding var indexDisplayMode: Int
        @Binding var backgroundDisplayMode: Int
        @Binding var isTextShown: Bool
        @Binding var isImageShown: Bool
        @Binding var accentColor: Color
        @Binding var backgroundColor: Color
        @Binding var isSafeAreaIgnored: Bool
        @Binding var tabBarHeight: CGFloat
        @Binding var tabBarColor: Color
        
        var code: String {
            
            var result = tabView
            
            if accentColor != .accentColor {
                result += "\n.accentColor(.\(accentColor))"
            }
            
            if isPaging {
                result += paging
            }
            
            return result
        }
        
        private var tabView: String {
            """
            TabView {
            \(tabs.indent)
            }
            """
        }
        
        private var tabs: String {
            
            (1...numberOfPages).map { index in
                
                var result = "\n"
                
                if backgroundColor == .clear {
                    result += tab(index: index, badges: Int(numberOfBadges))
                } else {
                    result += zstack(index: index, badges: Int(numberOfBadges))
                }
                
                return result
                
            }.joined(separator: "\n")
        }
        
        private func fix(_ number: Double) -> Double {
            round(number * 100) / 100
        }
        
        func colorString(_ color: Color) -> String {
            "Color(red: \(fix(color.rgba.red)), green: \(fix(color.rgba.green)), blue: \(fix(color.rgba.blue)))"
        }
        
        private var tabBar: String {
            "\n\nRectangle()".indent
                + "\n.fill(.clear)".indent.indent
                + "\n.frame(height: \(tabBarHeight))".indent.indent
                + "\n.background(\(colorString(tabBarColor)))".indent.indent
        }
        
        private func zstack(index: Int, badges: Int) -> String {
            
            var result = "ZStack {"
            
            if backgroundColor != .clear {
                result += "\n\n\(colorString(backgroundColor)).opacity(\(fix(backgroundColor.rgba.alpha)))".indent
                result += isSafeAreaIgnored ? ".ignoresSafeArea()" : ""
            }
            
            let content = "\n\n" + page(index: index, badges: Int(numberOfBadges), isBadgeVisible: false).indent
                + "\n.frame(maxHeight: .infinity)".indent.indent
            
            if tabBarHeight.isZero || tabBarColor == .clear{
                result += content
            } else {
                
                result += "\n\nVStack {".indent
                    + content.indent.indent
                    + tabBar.indent.indent
                    + "\n}".indent
            }
            
            result += "\n\n}"
            
            if index == 1 {
                result += "\n.badge(\(badges))"
            }
            
            result += tabItem(with: index)
            
            return result
        }
        
        private func page(index: Int, badges: Int, isBadgeVisible: Bool) -> String {
            
            var result = "Text(\("\"The \(index.spellOutOrdinal!.capitalized) Page\""))"

            guard isBadgeVisible, index == 1 else {
                return result
            }
            
            result += "\n.badge(\(badges))".indent
            
            return result
        }
        
        private func tab(index: Int, badges: Int) -> String {
            
            var result = page(index: index, badges: badges, isBadgeVisible: true)
            
            result += "\n" + tabItem(with: index).indent

            return result
        }
        
        private func tabItem(with index: Int) -> String {
            
            var result = ".tabItem {"
            
            if isImageShown {
                let imageName = "\(index).square.fill"
                result += "\n    Image(systemName: \"\(imageName)\")"
            }

            if isTextShown {
                    let text = index.spellOutOrdinal!.capitalized
                result += "\n    Text(\"\(text)\")"
            }
            
            return result + "\n}"
        }
        
        var paging: String {
            
            guard
                let indexDisplayMode = ExampleTabView.IndexDisplayMode(rawValue: indexDisplayMode),
                let backgroundDisplayMode = ExampleTabView.BackgroundDisplayMode(rawValue: backgroundDisplayMode)
            else {
                return ""
            }
            
            var result = "\n.tabViewStyle(.page(indexDisplayMode: \(indexDisplayMode.string)))"
            
            if indexDisplayMode != .never {
                result += "\n.indexViewStyle(.page(backgroundDisplayMode: \(backgroundDisplayMode.string)))"
            }
            
            return result
        }
    }
}

struct TabViewDemoView_Previews: PreviewProvider {
    static var previews: some View {
        let component = ComponentModel(name: "Tab Bar")
        TabViewDemoView(component: component)
    }
}
