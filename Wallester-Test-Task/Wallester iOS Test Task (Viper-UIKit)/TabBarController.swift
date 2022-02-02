//
//  TabBarController.swift
//  Wallester iOS Test Task (Viper-UIKit)
//
//  Created by Igor Ševtšenko on 01.01.2022.
//

import UIKit

class TabBarController: UITabBarController {
    override func viewDidLoad() {
        super.viewDidLoad()
        let favoriteBeers = FavoriteBeers()
        //MARK: - Setting up 1-st Tab
        let beersList = BeersListModuleBuilder.buildBeersListModule(favoriteBeers: favoriteBeers)
        let beersListNavController = UINavigationController(rootViewController: beersList)
        beersListNavController.tabBarItem = UITabBarItem(title: "All beers", image: nil, tag: 1)
       
        //MARK: - Setting up 2-nd Tab
        let favoriteBeersList = FavoriteBeersModuleBuilder.buildFavoriteBeersModule(of: favoriteBeers)
        let favoriteBeersListNavController = UINavigationController(rootViewController: favoriteBeersList)
        favoriteBeersListNavController.tabBarItem = UITabBarItem(title: "Favorites", image: nil, tag: 2)
        
        
        self.viewControllers = [beersListNavController, favoriteBeersListNavController]
        
    }
}
