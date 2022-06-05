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
                
                SectionView(title: "Architecture", items: sections.architecture)
                SectionView(title: "AudioKit", items: sections.audiokit)
                SectionView(title: "Combine", items: sections.combine)
                SectionView(title: "Concurrency", items: sections.concurrency)
                SectionView(title: "Data Structures & Algorithms", items: sections.dataStructAlgorithms)
                SectionView(title: "Design Patterns", items: sections.designPatterns)
                SectionView(title: "JSON", items: sections.json)
                SectionView(title: "Networking", items: sections.networking)
                SectionView(title: "Realm", items: sections.realm)
                SectionView(title: "Rx", items: sections.rx)
                
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
            audiokit: [],
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
