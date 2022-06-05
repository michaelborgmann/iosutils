//
//  SwiftUIModifiersModel.swift
//  SwiftArmyKnife
//
//  Created by Michael Borgmann on 05/06/2022.
//

import Foundation

struct SwiftUIModifiersModel: Identifiable, Decodable {
    
    var id = UUID()
    
    var controls: [ComponentModel]
    var effects: [ComponentModel]
    var layout: [ComponentModel]
    var text: [ComponentModel]
    var image: [ComponentModel]
    var list: [ComponentModel]
    var navigationBar: [ComponentModel]
    var style: [ComponentModel]
    var accessibility: [ComponentModel]
    var events: [ComponentModel]
    var gestures: [ComponentModel]
    var shapes: [ComponentModel]
    var other: [ComponentModel]
    
    enum CodingKeys: CodingKey {
        case controls
        case effects
        case layout
        case text
        case image
        case list
        case navigationBar
        case style
        case accessibility
        case events
        case gestures
        case shapes
        case other
    }
}
