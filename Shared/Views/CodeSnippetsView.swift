//
//  CodeSnippetsView.swift
//  SwiftArmyKnife
//
//  Created by Michael Borgmann on 04/06/2022.
//

import SwiftUI

struct CodeSnippetsView: View {
    
    let title: String
    let sections: CodeSnippetsModel
    
    var body: some View {
        
        NavigationView {
            
            List {
                
                ListSectionView(title: "Architecture", items: sections.architecture)
                ListSectionView(title: "AudioKit", items: sections.audiokit)
                ListSectionView(title: "Combine", items: sections.combine)
                ListSectionView(title: "Concurrency", items: sections.concurrency)
                ListSectionView(title: "Data Structures & Algorithms", items: sections.dataStructAlgorithms)
                ListSectionView(title: "Design Patterns", items: sections.designPatterns)
                ListSectionView(title: "JSON", items: sections.json)
                ListSectionView(title: "Networking", items: sections.networking)
                ListSectionView(title: "Realm", items: sections.realm)
                ListSectionView(title: "Rx", items: sections.rx)
                
            }.navigationBarTitle(title)
        }
    }
}

struct CodeSnippetsView_Previews: PreviewProvider {
    
    static var previews: some View {
        
        let component = ComponentModel(id: UUID(), name: "item")
        
        let content = CodeSnippetsModel(
            id: UUID(),
            architecture: [component],
            audiokit: [component],
            combine: [component],
            concurrency: [component],
            dataStructAlgorithms: [component],
            designPatterns: [component],
            json: [component],
            networking: [component],
            realm: [component],
            rx: [component]
        )
        
        CodeSnippetsView(title: "Code Snippets", sections: content)
    }
}
