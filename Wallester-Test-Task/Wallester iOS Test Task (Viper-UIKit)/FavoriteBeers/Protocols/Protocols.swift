//
//  Protocols.swift
//  Wallester iOS Test Task (Viper-UIKit)
//
//  Created by Igor Ševtšenko on 30.01.2022.
//

import Foundation
import UIKit

protocol FavoriteBeersViewProtocol: UIViewController{
    var presenter: FavoriteBeersPresenterProtocol!{get set}
    var orderField: OrderField {get set}
}

protocol FavoriteBeersInteractorProtocol: AnyObject{
    var favoriteBeers: FavoriteBeers {get set}
    func getFavoriteBeers()-> [Beer]
}

protocol FavoriteBeersPresenterProtocol: AnyObject{
    var view: FavoriteBeersViewProtocol! {get set}
    var interactor: FavoriteBeersInteractorProtocol! {get set}
    var router: FavoriteBeersRouterProtocol! {get set}
    var favoriteBeers: [Beer] {get}
    
    func getFavoritesBeers()
    func favoriteBeersSorted(by orderField: OrderField)
    func rowSelected(beer: Beer)
}

protocol FavoriteBeersRouterProtocol: AnyObject{
    func routeToBeerDetails(of beer: Beer,_ view: FavoriteBeersViewProtocol ,_ favoriteBeers: FavoriteBeers)
}
