//
//  SwiftUIViewsModel.swift
//  SwiftArmyKnife
//
//  Created by Michael Borgmann on 05/06/2022.
//

import Foundation

struct SwiftUIViewsModel: Identifiable, Decodable {
    
    var id = UUID()
    
    var views: [ComponentModel]
    var layout: [ComponentModel]
    var paint: [ComponentModel]
    var other: [ComponentModel]
    
    enum CodingKeys: CodingKey {
        case views
        case layout
        case paint
        case other
    }
    
    var components: [[ComponentModel]] {
        [views, layout, paint, other]
    }
}
