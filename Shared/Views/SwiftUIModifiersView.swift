//
//  SwiftUIModifiersView.swift
//  SwiftArmyKnife
//
//  Created by Michael Borgmann on 04/06/2022.
//

import SwiftUI

struct SwiftUIModifiersView: View {
        
    let title: String
    let sections: SwiftUIModifiersModel
    
    var body: some View {
        
        NavigationView {
            
            List {

                Group {
                    ListSectionView(title: "Controls", items: sections.controls)
                    ListSectionView(title: "Effects", items: sections.effects)
                    ListSectionView(title: "Layout", items: sections.layout)
                    ListSectionView(title: "Text", items: sections.text)
                    ListSectionView(title: "Image", items: sections.image)
                    ListSectionView(title: "List", items: sections.list)
                    ListSectionView(title: "Navigation Bar", items: sections.navigationBar)
                    ListSectionView(title: "Style", items: sections.style)
                    ListSectionView(title: "Accessibility", items: sections.accessibility)
                    ListSectionView(title: "Events", items: sections.events)
                }
                
                Group {
                    ListSectionView(title: "Gestures", items: sections.gestures)
                    ListSectionView(title: "Shapes", items: sections.shapes)
                    ListSectionView(title: "Other", items: sections.other)
                }
                
            }.navigationBarTitle(title)
        }
    }
}

struct SwiftUIModifiersView_Previews: PreviewProvider {
    
    static var previews: some View {
        
        let component = ComponentModel(id: UUID(), name: "item")
        
        let content = SwiftUIModifiersModel(
            id: UUID(),
            controls: [component],
            effects: [component],
            layout: [component],
            text: [component],
            image: [component],
            list: [component],
            navigationBar: [component],
            style: [component],
            accessibility: [component],
            events: [component],
            gestures: [component],
            shapes: [component],
            other: [component]
        )
        
        SwiftUIModifiersView(title: "SwiftUI Modifiers", sections: content)
    }
}
