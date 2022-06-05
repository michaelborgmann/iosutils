//
//  SwiftView.swift
//  SwiftArmyKnife
//
//  Created by Michael Borgmann on 05/06/2022.
//

import SwiftUI

struct SwiftView: View {
    
    let title: String
    let sections: SwiftModel
    
    var body: some View {
        
        NavigationView {
            List {
                SectionView(title: "Basics", items: sections.basics)
            }.navigationBarTitle(title)
        }
    }
}

struct SwiftView_Previews: PreviewProvider {
    static var previews: some View {
        let content = SwiftModel(id: UUID(), basics: [ComponentModel(id: UUID(), name: "item")])
        SwiftView(title: "View", sections: content)
    }
}
