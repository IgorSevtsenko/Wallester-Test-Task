//
//  FavoriteBeersModuleBuilder.swift
//  Wallester iOS Test Task (Viper-UIKit)
//
//  Created by Igor Ševtšenko on 31.01.2022.
//

import Foundation
import UIKit

class FavoriteBeersModuleBuilder{
    
    //MARK: - Build FavoriteBeers module
    static func buildFavoriteBeersModule(of favoriteBeers: FavoriteBeers)-> FavoriteBeersViewController{
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let vc = storyboard.instantiateViewController(withIdentifier: "FavoriteBeers") as! FavoriteBeersViewController
        let presenter = FavoriteBeersPresenter()
        let interactor = FavoriteBeersInteractor(favoriteBeers: favoriteBeers)
        let router = FavoriteBeersRouter()
        
        presenter.interactor = interactor
        presenter.router = router
        presenter.view = vc
        vc.presenter = presenter
        return vc
    }
}
