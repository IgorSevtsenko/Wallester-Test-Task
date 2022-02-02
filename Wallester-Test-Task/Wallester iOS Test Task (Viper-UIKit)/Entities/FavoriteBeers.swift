//
//  FavoriteBeers.swift
//  Wallester iOS Test Task (Viper-UIKit)
//
//  Created by Igor Ševtšenko on 31.12.2021.
//

import Foundation

class FavoriteBeers{
    var beers = [Beer]()
    
    init(){
        if let data = UserDefaults.standard.data(forKey: CodingKeys.FavoriteBeers.rawValue){
            let decoder = JSONDecoder()
            guard let decoded = try? decoder.decode([Beer].self, from: data)else{
                print("Failed to decode favoriteBeers from UserDefaults")
                self.beers = []
                return
            }
            self.beers = decoded
        }else{
            self.beers = []
        }
    }
}
