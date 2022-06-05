//
//  SwiftUIViewsView.swift
//  SwiftArmyKnife
//
//  Created by Michael Borgmann on 04/06/2022.
//

import SwiftUI

struct ListSection {
    
    let id = UUID()
    
    let title: String
    let items: [String]
}

struct ListSectionView: View {
    
    let title: String
    let items: [ComponentModel]
    
    var body: some View {
        
        Section(header: Text(title)) {
            ForEach(items, id: \.id) { item in
                NavigationLink(destination: DetailView(item: item.name)) {
                    Text(item.name)
                }
            }
        }
    }
}


struct SwiftUIViewsView: View {
    
    let title: String
    let sections: SwiftUIViewsModel
    
    var body: some View {
        
        NavigationView {
            
            List {
                
                ListSectionView(title: "Views", items: sections.views)
                ListSectionView(title: "Layout", items: sections.layout)
                ListSectionView(title: "Paint", items: sections.paint)
                ListSectionView(title: "Other", items: sections.other)
                
            }.navigationBarTitle(title)
        }
    }
}

struct SwiftUIViewsView_Previews: PreviewProvider {
    
    static var previews: some View {
        
        let content = SwiftUIViewsModel(
            id: UUID(),
            views: [ComponentModel(id: UUID(), name: "item 1")],
            layout: [ComponentModel(id: UUID(), name: "item 2")],
            paint: [ComponentModel(id: UUID(), name: "item 3")],
            other: [ComponentModel(id: UUID(), name: "item 4")]
        )
        
        SwiftUIViewsView(title: "SwiftUI Views", sections: content)
    }
}
