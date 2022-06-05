//
//  NavigationModel.swift
//  SwiftArmyKnife
//
//  Created by Michael Borgmann on 05/06/2022.
//

import Foundation

struct NavigationModel: Identifiable, Decodable {
    
    var id = UUID()
    
    var version: String
    var swift: SwiftModel
    var uikit: [ComponentModel]
    var views: SwiftUIViewsModel
    var modifiers: SwiftUIModifiersModel
    var codeSnippets: CodeSnippetsModel
    
    enum CodingKeys: String, CodingKey {
        case version
        case swift
        case uikit
        case views = "swiftui-views"
        case modifiers = "swiftui-modifiers"
        case codeSnippets = "code-snippets"
    }
}
