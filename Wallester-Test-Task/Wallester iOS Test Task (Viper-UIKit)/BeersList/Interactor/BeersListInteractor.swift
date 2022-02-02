//
//  BeersListInteractor.swift
//  Wallester iOS Test Task (Viper-UIKit)
//
//  Created by Igor Ševtšenko on 31.12.2021.
//

import Foundation

class BeersListInteractor:BeersListInteractorProtocol{

    var service : PunkApiService
    var favoriteBeers: FavoriteBeers
    
    init(serice: PunkApiService, favoriteBeers: FavoriteBeers){
        self.service = serice
        self.favoriteBeers = favoriteBeers
    }
    
    //MARK: - Load list of Beers
    func loadList(at page: Int, completion: @escaping ([Beer])->()){
        service.loadList(at: page) { beers in
            completion(beers)
        }
    }
    
    //MARK: - Check if beer is favorite
    func beerIsFavorite(_ beer: Beer) -> Bool{
        favoriteBeers.beers.contains(beer)
    }
    
    func addOrRemoveFromFavorites(_ beer: Beer) {
        if beerIsFavorite(beer){
            removeFromFavorites(beer)
        }else{
            addToFavorites(beer: beer)
        }
    }
    
    //MARK: - Add beer to favoriteBeers
    private func addToFavorites(beer: Beer){
        favoriteBeers.beers.append(beer)
        saveFavoriteBeers()
    }
    
    //MARK: - Remove beer from favorites
    private func removeFromFavorites(_ beer: Beer){
        favoriteBeers.beers.removeAll { $0 == beer }
        saveFavoriteBeers()
    }
    
    //MARK: - Save favoriteBeers to UserDefaults
    private func saveFavoriteBeers() {
        let encoder = JSONEncoder()
        guard let beers = try? encoder.encode(favoriteBeers.beers)else{
            print("Failed to save favoriteBeers to UserDefaults")
            return
        }
        UserDefaults.standard.set(beers, forKey: CodingKeys.FavoriteBeers.rawValue)
    }
    
    
}
