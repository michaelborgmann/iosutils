//
//  Models.swift
//  SwiftArmyKnife
//
//  Created by Michael Borgmann on 04/06/2022.
//

import Foundation

struct ComponentModel: Identifiable, Decodable {
    
    var id = UUID()
    
    var name: String
    var icon: String? = nil
    var documentation: String? = nil
    
    enum CodingKeys: CodingKey {
        case name
        case icon
        case documentation
    }
}


