//
//  BeersListModuleBuilder.swift
//  Wallester iOS Test Task (Viper-UIKit)
//
//  Created by Igor Ševtšenko on 01.01.2022.
//

import Foundation
import UIKit

class BeersListModuleBuilder{
    //MARK: - Build BeerList module
    static func buildBeersListModule(favoriteBeers: FavoriteBeers)->BeersListTableViewController{
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let vc = storyboard.instantiateViewController(withIdentifier: "BeerList") as! BeersListTableViewController
        let presenter = BeersListPresenter()
        let router = BeersListRouter()
        let service = PunkApiService()
        let interactor = BeersListInteractor(serice: service, favoriteBeers: favoriteBeers)
        
        vc.presenter = presenter
        presenter.interactor = interactor
        presenter.view = vc
        presenter.router = router
        return vc
    }
}
