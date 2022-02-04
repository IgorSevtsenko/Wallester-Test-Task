//
//  BeerDetailsProtocols.swift
//  Wallester iOS Test Task (Viper-UIKit)
//
//  Created by Igor Ševtšenko on 16.01.2022.
//

import Foundation
import UIKit

protocol BeerDetailsPresenterProtocol: AnyObject{
    var interactor: BeerDetailsInteractorProtocol! {get}
    func beerName() -> String
    func formattedABV() -> String
    func formattedEBC() -> String
    func formattedIBU() -> String
    func addToFavoriteButtonColor() -> UIColor
    func addOrRemoveFromFavorites()
}

protocol BeerDetailsInteractorProtocol: AnyObject{
    var beer: Beer {get set}
    var favoriteBeers: FavoriteBeers {get set}
    func addOrRemoveFromFavorites()
    func beerIsFavorite() -> Bool
}

protocol BeerDetailsViewProtocol: UIViewController{
    var presenter: BeerDetailsPresenterProtocol! {get set}
}

