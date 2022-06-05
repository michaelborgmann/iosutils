//
//  ContentView.swift
//  Shared
//
//  Created by Michael Borgmann on 04/06/2022.
//

import SwiftUI

struct ContentView: View {
    
    fileprivate func isContentEmpty(_ content: NavigationModel) -> Bool {
        
        guard
            content.swift.isEmpty,
            content.uikit.isEmpty,
            content.views.isEmpty,
            content.modifiers.isEmpty,
            content.codeSnippets.isEmpty
        else {
            return false
        }
        
        return true
    }
    
    var body: some View {
        
        let content: NavigationModel = load("content.json")
        
        if isContentEmpty(content) {
            Text("No examples available")
        } else {
        
            TabView {
                
                if !content.swift.basics.isEmpty {
                    SwiftView(title: "Swift", sections: content.swift).tabItem {
                        Label("Swift", image: "Swift_Normal")
                    }
                }
                
                if !content.uikit.isEmpty {
                    UIKitView(title: "UIKit", sections: content.uikit).tabItem {
                        Label("UIKit", systemImage: "chevron.left.forwardslash.chevron.right")
                    }
                }
                
                if !content.views.isEmpty {
                    SwiftUIViewsView(title: "Views", sections: content.views).tabItem {
                        Label("SwiftUI Views", image: "SwiftUI_Objects-Line_Normal")
                    }
                }
                
                if !content.modifiers.isEmpty {
                    SwiftUIModifiersView(title: "Modifiers", sections: content.modifiers).tabItem {
                        Label("SwiftUI Modifiers", image: "Modifiers-Line_Normal")
                    }
                }

                if !content.codeSnippets.isEmpty {
                    CodeSnippetsView(title: "Snippets", sections: content.codeSnippets).tabItem {
                        Label("Snippets", image: "Snippets-Line_Normal")
                    }
                }
            }
        }
    }
    
    func load<T: Decodable>(_ filename: String) -> T {
        let data: Data

        guard let file = Bundle.main.url(forResource: filename, withExtension: nil)
            else {
                fatalError("Couldn't find \(filename) in main bundle.")
        }

        do {
            data = try Data(contentsOf: file)
        } catch {
            fatalError("Couldn't load \(filename) from main bundle:\n\(error)")
        }

        do {
            let decoder = JSONDecoder()
            return try decoder.decode(T.self, from: data)
        } catch {
            fatalError("Couldn't parse \(filename) as \(T.self):\n\(error)")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
