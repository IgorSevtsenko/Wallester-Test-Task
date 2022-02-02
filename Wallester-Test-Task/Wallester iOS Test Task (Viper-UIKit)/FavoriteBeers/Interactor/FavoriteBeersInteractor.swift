//
//  FavoriteBeersInteractor.swift
//  Wallester iOS Test Task (Viper-UIKit)
//
//  Created by Igor Ševtšenko on 31.01.2022.
//

import Foundation

class FavoriteBeersInteractor:FavoriteBeersInteractorProtocol{
    var favoriteBeers: FavoriteBeers
    
    init(favoriteBeers: FavoriteBeers){
        self.favoriteBeers = favoriteBeers
    }
    
    //MARK: - Return all favorite beers
    func getFavoriteBeers()-> [Beer]{
        return favoriteBeers.beers
    }
}
