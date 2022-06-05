//
//  SwiftUIViewsView.swift
//  SwiftArmyKnife
//
//  Created by Michael Borgmann on 04/06/2022.
//

import SwiftUI

struct SwiftUIViewsView: View {
    
    let title: String
    let sections: SwiftUIViewsModel
    
    var body: some View {
        
        NavigationView {
            
            List {
                
                SectionView(title: "Views", items: sections.views)
                SectionView(title: "Layout", items: sections.layout)
                SectionView(title: "Paint", items: sections.paint)
                SectionView(title: "Other", items: sections.other)
                
            }.navigationBarTitle(title)
        }
    }
}

struct SwiftUIViewsView_Previews: PreviewProvider {
    
    static var previews: some View {
        
        let content = SwiftUIViewsModel(
            id: UUID(),
            views: [ComponentModel(id: UUID(), name: "Tab View", icon: "TabbedView-32_Normal")],
            layout: [], paint: [], other: []
        )
        
        SwiftUIViewsView(title: "SwiftUI Views", sections: content)
    }
}
