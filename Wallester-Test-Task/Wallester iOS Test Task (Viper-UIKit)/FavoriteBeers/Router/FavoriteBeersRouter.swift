//
//  FavoriteBeersRouter.swift
//  Wallester iOS Test Task (Viper-UIKit)
//
//  Created by Igor Ševtšenko on 31.01.2022.
//

import Foundation
import UIKit

class FavoriteBeersRouter: FavoriteBeersRouterProtocol{
    
    //MARK: - Route to BeerDetails View
    func routeToBeerDetails(of beer: Beer,_ view: FavoriteBeersViewProtocol ,_ favoriteBeers: FavoriteBeers){
        let beerDetailsView = BeerDetailsModuleBuilder.buildBeerDetailsModule(of: beer, favoriteBeers)
        view.show(beerDetailsView, sender: self)
    }
}
