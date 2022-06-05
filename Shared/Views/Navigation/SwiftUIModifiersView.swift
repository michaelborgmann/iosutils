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
                    SectionView(title: "Controls", items: sections.controls)
                    SectionView(title: "Effects", items: sections.effects)
                    SectionView(title: "Layout", items: sections.layout)
                    SectionView(title: "Text", items: sections.text)
                    SectionView(title: "Image", items: sections.image)
                    SectionView(title: "List", items: sections.list)
                    SectionView(title: "Navigation Bar", items: sections.navigationBar)
                    SectionView(title: "Style", items: sections.style)
                    SectionView(title: "Accessibility", items: sections.accessibility)
                    SectionView(title: "Events", items: sections.events)
                }
                
                Group {
                    SectionView(title: "Gestures", items: sections.gestures)
                    SectionView(title: "Shapes", items: sections.shapes)
                    SectionView(title: "Other", items: sections.other)
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
