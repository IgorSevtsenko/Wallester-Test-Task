//
//  Beer.swift
//  Wallester iOS Test Task (Viper-UIKit)
//
//  Created by Igor Ševtšenko on 31.12.2021.
//

import Foundation

struct Beer: Codable,Equatable{
    static func == (lhs: Beer, rhs: Beer) -> Bool {
        return lhs.id == rhs.id
    }
    
    let id: Int
    let name: String
    let abv: Double
    var ebc: Double?
    var ibu: Double?
}
