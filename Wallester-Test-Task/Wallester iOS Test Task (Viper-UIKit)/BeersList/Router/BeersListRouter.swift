//
//  BeersListRouter.swift
//  Wallester iOS Test Task (Viper-UIKit)
//
//  Created by Igor Ševtšenko on 31.12.2021.
//

import Foundation
import UIKit

class BeersListRouter: BeersListRouterProtocol{
    //MARK: - Route to BeerDetails View
    func routeToBeerDetails(of beer: Beer,_ view: BeersListViewProtocol ,_ favoriteBeers: FavoriteBeers){
        let beerDetailsView = BeerDetailsModuleBuilder.buildBeerDetailsModule(of: beer, favoriteBeers)
        view.show(beerDetailsView, sender: self)
    }
}
