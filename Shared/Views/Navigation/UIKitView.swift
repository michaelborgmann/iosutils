//
//  UIKitView.swift
//  SwiftArmyKnife
//
//  Created by Michael Borgmann on 05/06/2022.
//

import SwiftUI

struct UIKitView: View {
    
    let title: String
    let sections: [ComponentModel]
    
    var body: some View {
        
        NavigationView {
            
            List {
                
                SectionView(title: "All Components", items: sections)
                
            }.navigationBarTitle(title)
        }
    }
}

struct UIKitView_Previews: PreviewProvider {
    static var previews: some View {
        let content = [ComponentModel(id: UUID(), name: "item")]
        UIKitView(title: "UIKit", sections: content)
    }
}
