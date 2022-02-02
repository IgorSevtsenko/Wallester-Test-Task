//
//  BeersListViewController.swift
//  Wallester iOS Test Task (Viper-UIKit)
//
//  Created by Igor Ševtšenko on 01.01.2022.
//

import UIKit

protocol BeerCellDelegate: AnyObject{
    func addOrRemoveFromFavorites(_ beer: Beer)
}

class BeersListTableViewController: UITableViewController,BeersListViewProtocol {
    var presenter: BeersListPresenterProtocol!
    var currentPage: Int = 1
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "All beers"
        let nib = UINib(nibName: "BeerCell", bundle: nil)
        self.tableView.register(nib, forCellReuseIdentifier: "BeerCell")
        
        presenter.loadList(at: currentPage)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        updateTableData()
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return presenter.beers.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        //MARK: - Creating BeerCell
        let cell = tableView.dequeueReusableCell(withIdentifier: "BeerCell", for: indexPath) as! BeerCell
        cell.cellDelegate = self
        
        //MARK: - Beer for each cell
        let beer = presenter.beers[indexPath.row]
        cell.beer = beer
        
        //MARK: - Setting up cells attributes
        cell.beerName.text = beer.name
        cell.beerABV.text = "Vol: \(presenter.formattedABV(beer.abv))"
        
        cell.addToFavoritesButton.setImage(UIImage(systemName: SystemImages.FilledStar.rawValue), for: .normal)
        cell.addToFavoritesButton.tintColor = presenter.addToFavoriteButtonColor(beer)
        
        presenter.loadMoreBeersAfter(beer)
        return cell
    }
    

    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let beer = presenter.beers[indexPath.row]
        presenter.rowSelected(beer: beer)
    }
    
    //MARK: - Update TableView
    func updateTableData(){
        tableView.reloadData()
    }
    
}

extension BeersListTableViewController: BeerCellDelegate{
    //MARK: - Add or remove beer from favorites
    func addOrRemoveFromFavorites(_ beer: Beer) {
        presenter.addOrRemoveFromFavorites(beer)
        updateTableData()
    }
}
