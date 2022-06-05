//
//  ContentView.swift
//  Shared
//
//  Created by Michael Borgmann on 04/06/2022.
//

import SwiftUI

struct ContentView: View {
    
    var body: some View {
        
        let content: NavigationModel = load("content.json")
        
        TabView {
            
            SwiftView(title: "Swift", sections: content.swift).tabItem {
                Label("Swift", image: "Swift_Normal")
            }
            
            UIKitView(title: "UIKit", sections: content.uikit).tabItem {
                Label("UIKit", systemImage: "chevron.left.forwardslash.chevron.right")
            }
            
            SwiftUIViewsView(title: "Views", sections: content.views).tabItem {
                Label("SwiftUI Views", image: "SwiftUI_Objects-Line_Normal")
            }
            
            SwiftUIModifiersView(title: "Modifiers", sections: content.modifiers).tabItem {
                Label("SwiftUI Modifiers", image: "Modifiers-Line_Normal")
            }

            CodeSnippetsView(title: "Snippets", sections: content.codeSnippets).tabItem {
                Label("Snippets", image: "Snippets-Line_Normal")
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
