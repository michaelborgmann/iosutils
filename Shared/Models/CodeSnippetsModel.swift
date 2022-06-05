//
//  CodeSnippetsModel.swift
//  SwiftArmyKnife
//
//  Created by Michael Borgmann on 05/06/2022.
//

import Foundation

struct CodeSnippetsModel: Identifiable, Decodable {
    
    var id = UUID()
    
    var architecture: [ComponentModel]
    var audiokit: [ComponentModel]
    var combine: [ComponentModel]
    var concurrency: [ComponentModel]
    var dataStructAlgorithms: [ComponentModel]
    var designPatterns: [ComponentModel]
    var json: [ComponentModel]
    var networking: [ComponentModel]
    var realm: [ComponentModel]
    var rx: [ComponentModel]
    
    enum CodingKeys: String, CodingKey {
        case architecture
        case audiokit
        case combine
        case concurrency
        case dataStructAlgorithms = "data-struct-algorithms"
        case designPatterns = "design-patterns"
        case json
        case networking
        case realm
        case rx
    }
    
    var isEmpty: Bool {
        
        guard architecture.isEmpty, audiokit.isEmpty, combine.isEmpty, concurrency.isEmpty, dataStructAlgorithms.isEmpty,
              designPatterns.isEmpty, json.isEmpty, networking.isEmpty, realm.isEmpty, rx.isEmpty
        else {
            return false
        }
        
        return true
    }
}
