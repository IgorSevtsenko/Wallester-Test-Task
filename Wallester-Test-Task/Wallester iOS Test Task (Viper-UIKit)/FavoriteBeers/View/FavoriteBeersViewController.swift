//
//  FavoriteBeersViewController.swift
//  Wallester iOS Test Task (Viper-UIKit)
//
//  Created by Igor Ševtšenko on 31.01.2022.
//

import UIKit

class FavoriteBeersViewController: UIViewController, FavoriteBeersViewProtocol{
    
    var presenter: FavoriteBeersPresenterProtocol!
    var orderField: OrderField = OrderField.name
    
    @IBOutlet var sortingPicker: UISegmentedControl!
    @IBOutlet var favoriteBeersList: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Favorite"
        
        //MARK: - TableView
        setUpTableView()
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        presenter.getFavoritesBeers()
        favoriteBeersList.reloadData()
    }
    
    @IBAction func sortBy(_ sender: UISegmentedControl) {
        switch sortingPicker.selectedSegmentIndex{
        case 0:
            orderField = .name
            presenter.favoriteBeersSorted(by: orderField)
            favoriteBeersList.reloadData()
        case 1:
            orderField = .ibu
            presenter.favoriteBeersSorted(by: orderField)
            favoriteBeersList.reloadData()
        case 2:
            orderField = .ebc
            presenter.favoriteBeersSorted(by: orderField)
            favoriteBeersList.reloadData()
        case 3:
            orderField = .ibu
            presenter.favoriteBeersSorted(by: orderField)
            favoriteBeersList.reloadData()
        default:
            orderField = .name
            presenter.favoriteBeersSorted(by: orderField)
            favoriteBeersList.reloadData()
        }
    }
    
    //MARK: - Setting up TableView
    private func setUpTableView(){
        favoriteBeersList.dataSource = self
        favoriteBeersList.delegate = self
        
        let nib = UINib(nibName: "FavoriteBeersListCell", bundle: nil)
        self.favoriteBeersList.register(nib, forCellReuseIdentifier: "FavoriteBeersListCell")
        
    }
}

extension FavoriteBeersViewController: UITableViewDelegate, UITableViewDataSource{
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return presenter.favoriteBeers.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let beer = presenter.favoriteBeers[indexPath.row]
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "FavoriteBeersListCell", for: indexPath) as! FavoriteBeersListCell
        cell.beerName.text = beer.name
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let beer = presenter.favoriteBeers[indexPath.row]
        presenter.rowSelected(beer: beer)
    }
}
