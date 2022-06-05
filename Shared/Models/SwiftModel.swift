//
//  SwiftModel.swift
//  SwiftArmyKnife
//
//  Created by Michael Borgmann on 05/06/2022.
//

import Foundation

struct SwiftModel: Identifiable, Decodable {
    
    var id = UUID()
    
    var basics: [ComponentModel]

    enum CodingKeys: CodingKey {
        case basics
    }
}
