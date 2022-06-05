//
//  SourceCodeView.swift
//  SwiftArmyKnife
//
//  Created by Michael Borgmann on 05/06/2022.
//

import SwiftUI
import CodeEditor

struct SourceCodeView: View {
    
    @State var source: String
    
    init(source: String) {
        _source = State(initialValue: source)
    }
    
    var body: some View {
        CodeEditor(source: $source, language: .swift, theme: .ocean)
    }
}

struct SourceCodeView_Previews: PreviewProvider {
    static var previews: some View {
        SourceCodeView(source: "let a = 42")
    }
}
