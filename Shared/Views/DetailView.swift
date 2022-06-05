//
//  DetailView.swift
//  SwiftArmyKnife
//
//  Created by Michael Borgmann on 05/06/2022.
//

import SwiftUI

struct DetailView: View {
    let item: String
    
    var body: some View {
        Text(item)
            .navigationBarTitle(Text(item), displayMode: .inline)
    }
}

struct DetailView_Previews: PreviewProvider {
    static var previews: some View {
        DetailView(item: "Title").previewLayout(.sizeThatFits)
    }
}
