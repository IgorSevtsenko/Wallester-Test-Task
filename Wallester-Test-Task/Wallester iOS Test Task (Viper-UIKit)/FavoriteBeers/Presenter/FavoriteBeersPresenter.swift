//
//  FavoriteBeersPresenter.swift
//  Wallester iOS Test Task (Viper-UIKit)
//
//  Created by Igor Ševtšenko on 30.01.2022.
//

import Foundation

class FavoriteBeersPresenter: FavoriteBeersPresenterProtocol{
    weak var view: FavoriteBeersViewProtocol!
    var interactor: FavoriteBeersInteractorProtocol!
    var router: FavoriteBeersRouterProtocol!
    
    var favoriteBeers = [Beer]()
    
    //MARK: - Sort and return favoriteBeers by orderField
    func favoriteBeersSorted(by orderField: OrderField){
        switch orderField {
        case .name:
            favoriteBeers = favoriteBeers.sorted(by: {$0.name < $1.name})
        case .abv:
            favoriteBeers = favoriteBeers.sorted(by: {$0.abv < $1.abv})
        case .ebc:
            favoriteBeers = favoriteBeers.sorted(by: {$0.ebc ?? 0 < $1.ebc ?? 0})
        case .ibu:
            favoriteBeers = favoriteBeers.sorted(by: {$0.ibu ?? 0 < $1.ibu ?? 0})
        }
            
        }
    //MARK: - Request favoriteBeers from interactor
    func getFavoritesBeers(){
        let beers = interactor.getFavoriteBeers()
        favoriteBeers.removeAll()
        self.favoriteBeers = beers
    }
    
    //MARK: - Route to BeerDetails view
    func rowSelected(beer: Beer){
        router.routeToBeerDetails(of: beer, self.view, interactor.favoriteBeers)
    }
    
    
}

enum OrderField: String{
    case name = "Name"
    case abv = "Alcohol"
    case ebc = "EBC"
    case ibu = "IBU"
}
