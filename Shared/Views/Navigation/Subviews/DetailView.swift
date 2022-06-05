//
//  DetailView.swift
//  SwiftArmyKnife
//
//  Created by Michael Borgmann on 05/06/2022.
//

import SwiftUI

struct DetailView: View {
    
    let title: String
    
    var body: some View {
        Text("No example found")
            .navigationBarTitle(Text(title), displayMode: .inline)
    }
}

struct DetailView_Previews: PreviewProvider {
    static var previews: some View {
        DetailView(title: "Button").previewLayout(.sizeThatFits)
    }
}
