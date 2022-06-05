//
//  SectionView.swift
//  SwiftArmyKnife
//
//  Created by Michael Borgmann on 05/06/2022.
//

import SwiftUI

struct SectionView: View {
    
    private let placeholder = "chevron.left.forwardslash.chevron.right"
    
    let title: String
    let items: [ComponentModel]
    
    var body: some View {
        
        if items.isEmpty {
            EmptyView()
        } else {
        
            Section(header: Text(title)) {
                ForEach(items, id: \.id) { item in
                    
                    switch item.name {
                    case "Tab View":
                        NavigationLink(destination: TabViewDemoView(component: item)) {
                            Label(item.name, image: item.icon ?? "chevron.left.forwardslash.chevron.right")
                        }
                    default:
                        NavigationLink(destination: DetailView(title: item.name)) {
                            Label(item.name, image: item.icon ?? placeholder)
                        }
                    }
                }
            }
        }
    }
}

struct SectionView_Previews: PreviewProvider {
    static var previews: some View {
        SectionView(title: "Title", items: [ComponentModel(id: UUID(), name: "Tab View", icon: "TabbedView-32_Normal")]).previewLayout(.sizeThatFits)
    }
}
