//
//  Helper.swift
//  SwiftArmyKnife
//
//  Created by Michael Borgmann on 05/06/2022.
//

import Foundation

enum SpelledOutOrdinalNumber: String {
    
    case first
    case second
    case third
    case fifth
    case eighth
    case ninth
    case twelfth
    case twentieth
    case thirtieth
    case fortieth
    case fiftieth
    case sixtieth
    case seventieth
    case eightieth
    case ninetieth
    
    init?(int number: Int) {
        switch number {
        case 1: self = .first
        case 2: self = .second
        case 3: self = .third
        case 5: self = .fifth
        case 8: self = .eighth
        case 9: self = .ninth
        case 12: self = .twelfth
        case 20: self = .twentieth
        case 30: self = .thirtieth
        case 40: self = .fortieth
        case 50: self = .fiftieth
        case 60: self = .sixtieth
        case 70: self = .seventieth
        case 80: self = .eightieth
        case 90: self = .ninetieth
        default: return nil
        }
    }
}

extension Int {
    
    var spellOut: String? {
        let formatter = NumberFormatter()
        formatter.numberStyle = .spellOut
        
        guard let spelled = formatter.string(from: self as NSNumber) else {
            return nil
        }
        
        return spelled
    }
    
    var spellOutOrdinal: String? {
        
        guard let spellOut = spellOut else { return nil }
        
        switch self {
        case 1:
            return SpelledOutOrdinalNumber.first.rawValue
        case 2:
            return SpelledOutOrdinalNumber.second.rawValue
        case 3:
            return SpelledOutOrdinalNumber.third.rawValue
        case 5:
            return SpelledOutOrdinalNumber.fifth.rawValue
        case 8:
            return SpelledOutOrdinalNumber.eighth.rawValue
        case 9:
            return SpelledOutOrdinalNumber.ninth.rawValue
        case 12:
            return SpelledOutOrdinalNumber.twelfth.rawValue
        case 20:
            return SpelledOutOrdinalNumber.twentieth.rawValue
        case 30:
            return SpelledOutOrdinalNumber.thirtieth.rawValue
        case 40:
            return SpelledOutOrdinalNumber.fortieth.rawValue
        case 50:
            return SpelledOutOrdinalNumber.fiftieth.rawValue
        case 60:
            return SpelledOutOrdinalNumber.sixtieth.rawValue
        case 70:
            return SpelledOutOrdinalNumber.seventieth.rawValue
        case 80:
            return SpelledOutOrdinalNumber.eightieth.rawValue
        case 90:
            return SpelledOutOrdinalNumber.ninetieth.rawValue
        default:
            
            let ordinal: (Int) -> String? = { number in
                SpelledOutOrdinalNumber(int: number)?.rawValue
            }
            
            if let ordinal = ordinal(1) {
                return spellOut.replacingOccurrences(of: 1.spellOut!, with: ordinal)
            }

            if let ordinal = ordinal(2) {
                return spellOut.replacingOccurrences(of: 2.spellOut!, with: ordinal)
            }
            
            if let ordinal = ordinal(3) {
                return spellOut.replacingOccurrences(of: 3.spellOut!, with: ordinal)
            }
            
            if let ordinal = ordinal(5) {
                return spellOut.replacingOccurrences(of: 5.spellOut!, with: ordinal)
            }
            
            if let ordinal = ordinal(8) {
                return spellOut.replacingOccurrences(of: 8.spellOut!, with: ordinal)
            }
            
            if let ordinal = ordinal(9) {
                return spellOut.replacingOccurrences(of: 9.spellOut!, with: ordinal)
            }
            
            return spellOut + "th"
        }
    }
}
