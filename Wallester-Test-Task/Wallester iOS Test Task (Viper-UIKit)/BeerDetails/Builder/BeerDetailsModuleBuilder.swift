//
//  BeerDetailsModuleBuilder.swift
//  Wallester iOS Test Task (Viper-UIKit)
//
//  Created by Igor Ševtšenko on 20.01.2022.
//

import Foundation
import UIKit

class BeerDetailsModuleBuilder{
    //MARK: - Build BeerDetails module
    static func buildBeerDetailsModule(of beer:Beer, _ favoriteBeers: FavoriteBeers) -> BeerDetailsViewController{
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let vc = storyboard.instantiateViewController(withIdentifier: "BeerDetails") as! BeerDetailsViewController
        let presenter = BeerDetailsPresenter()
        let interactor = BeerDetailsInteractor(beer: beer, favoriteBeers: favoriteBeers)
        
        presenter.interactor = interactor
        vc.presenter = presenter
        return vc
    }
}
