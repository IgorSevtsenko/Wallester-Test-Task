//
//  BeersListPresenter.swift
//  Wallester iOS Test Task (Viper-UIKit)
//
//  Created by Igor Ševtšenko on 31.12.2021.
//

import Foundation
import UIKit

class BeersListPresenter: BeersListPresenterProtocol{    
    weak var view: BeersListViewProtocol!
    var interactor : BeersListInteractorProtocol!
    var router:  BeersListRouterProtocol!
    
    
    var beers = [Beer](){
        didSet{
            self.view.updateTableData()
        }
    }
    
    //MARK: - Load list of beers
    func loadList(at page: Int){
        interactor.loadList(at: page) { beers in
            DispatchQueue.main.async {
                self.beers.append(contentsOf: beers)
            }
        }
    }
    
    //MARK: - Format beer ABV to 1 number after decimal
    func formattedABV(_ abv: Double) -> String{
        let formatted = String(format: "%.1f", abv)
        return formatted
    }
    
    //MARK: - Returns color for "Add To Favorites" button
    func addToFavoriteButtonColor(_ beer: Beer) -> UIColor{
        if interactor.beerIsFavorite(beer){
            return UIColor.systemYellow
        }else{
            return UIColor.systemGray4
        }
    }
    
    //MARK: - Remove or add beer to FavoriteBeers
    func addOrRemoveFromFavorites(_ beer: Beer){
        interactor.addOrRemoveFromFavorites(beer)
        print(interactor.favoriteBeers.beers.count)
        
    }
    
    //MARK: - Add more beers to current list
    func loadMoreBeersAfter(_ beer: Beer){
        if shouldLoadData(after: beer){
            self.view.currentPage += 1
            loadList(at: self.view.currentPage)
        }
    }
    
    //MARK: - Route to BeerDetals View of selected row
    func rowSelected(beer: Beer){
        router.routeToBeerDetails(of: beer, self.view, interactor.favoriteBeers)
    }
    
    //MARK: - Load more data after 3-rd element from the end of an array
    private func shouldLoadData(after beer: Beer) -> Bool{
        var beerIndex = 0
        for i in (0..<beers.count) {
            if beers[i] == beer {
                beerIndex = i
            }
        }
        return  beerIndex == beers.count - 2
    }
    
}

