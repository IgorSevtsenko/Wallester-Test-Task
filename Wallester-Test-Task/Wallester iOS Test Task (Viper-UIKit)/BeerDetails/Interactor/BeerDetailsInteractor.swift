//
//  BeerDetailsInteractor.swift
//  Wallester iOS Test Task (Viper-UIKit)
//
//  Created by Igor Ševtšenko on 20.01.2022.
//

import Foundation

class BeerDetailsInteractor: BeerDetailsInteractorProtocol{
    var beer: Beer
    var favoriteBeers: FavoriteBeers
    
    init(beer: Beer, favoriteBeers: FavoriteBeers){
        self.beer = beer
        self.favoriteBeers = favoriteBeers
    }
    
    //MARK: - Check if beer is favorite
    func beerIsFavorite() -> Bool {
        favoriteBeers.beers.contains(self.beer)
    }
    
    //MARK: - Add or remove beer from favorites
    func addOrRemoveFromFavorites() {
        if beerIsFavorite(){
            removeFromFavorites()
        }else{
            addToFavorites()
        }
        
    }
    
    //MARK: - Add beer to favorites
    private func addToFavorites() {
        favoriteBeers.beers.append(self.beer)
        saveFavoriteBeers()
    }
    
    //MARK: - Remove beer from favorites
    private func removeFromFavorites() {
        favoriteBeers.beers.removeAll { $0 == self.beer }
        saveFavoriteBeers()
    }
    
    //MARK: Save favorite beers to User Defaults
    private func saveFavoriteBeers() {
        let encoder = JSONEncoder()
        guard let beers = try? encoder.encode(favoriteBeers.beers)else{
            print("Failed to save favoriteBeers to UserDefaults")
            return
        }
        UserDefaults.standard.set(beers, forKey: CodingKeys.FavoriteBeers.rawValue)
    }
    
}
