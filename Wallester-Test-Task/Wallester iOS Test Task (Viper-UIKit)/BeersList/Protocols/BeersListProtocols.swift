//
//  BeersListProtocols.swift
//  Wallester iOS Test Task (Viper-UIKit)
//
//  Created by Igor Ševtšenko on 31.12.2021.
//

import Foundation
import UIKit

protocol BeersListViewProtocol:UIViewController{
    var presenter: BeersListPresenterProtocol! {get set}
    var currentPage: Int {get set}
    func updateTableData()
}

protocol BeersListPresenterProtocol:AnyObject{
    var view: BeersListViewProtocol! {get set}
    var interactor: BeersListInteractorProtocol! {get set}
    var router: BeersListRouterProtocol! {get set}
    var beers: [Beer] {get set}
    func loadList(at page: Int)
    func formattedABV(_ abv: Double) -> String
    func addOrRemoveFromFavorites(_ beer: Beer)
    func loadMoreBeersAfter(_ beer: Beer)
    func addToFavoriteButtonColor(_ beer: Beer) -> UIColor
    func rowSelected(beer: Beer)
}

protocol BeersListInteractorProtocol:AnyObject{
    var favoriteBeers: FavoriteBeers {get set}
    func loadList(at page: Int, completion: @escaping ([Beer])->())
    func addOrRemoveFromFavorites(_ beer: Beer)
    func beerIsFavorite(_ beer: Beer) -> Bool
}

protocol BeersListRouterProtocol:AnyObject{
    func routeToBeerDetails(of beer: Beer,_ view: BeersListViewProtocol ,_ favoriteBeers: FavoriteBeers)
}


