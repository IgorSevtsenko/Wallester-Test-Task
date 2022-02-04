//
//  BeerDetailsPresenter.swift
//  Wallester iOS Test Task (Viper-UIKit)
//
//  Created by Igor Ševtšenko on 16.01.2022.
//

import Foundation
import UIKit

class BeerDetailsPresenter:BeerDetailsPresenterProtocol{
    
    var interactor: BeerDetailsInteractorProtocol!
    
    
    func beerName() -> String {
        interactor.beer.name
    }
    
    //MARK: - Format beer ABV to 1 number after decimal
    func formattedABV() -> String{
        let formatted = String(format: "%.1f", interactor.beer.abv)
        return formatted
    }
    
    //MARK: - Format beer EBC to 1 number after decimal
    func formattedEBC() -> String{
        guard interactor.beer.ebc != nil else{
            return "N/A"
        }
        let formatted = String(format: "%.1f", interactor.beer.ebc!)
        return formatted
    }
    
    //MARK: - Format beer IBU to 1 number after decimal
    func formattedIBU() -> String{
        guard interactor.beer.ibu != nil else{
            return "N/A"
        }
        let formatted = String(format: "%.1f", interactor.beer.ibu!)
        return formatted
    }
    
    //MARK: - Color for "Add To Favorites" button
    func addToFavoriteButtonColor() -> UIColor {
        if interactor.beerIsFavorite(){
            return UIColor.systemYellow
        }else{
            return UIColor.systemGray4
        }
    }
    
    //MARK: - Add or remove beer from favorites
    func addOrRemoveFromFavorites(){
        interactor.addOrRemoveFromFavorites()
    }
}
