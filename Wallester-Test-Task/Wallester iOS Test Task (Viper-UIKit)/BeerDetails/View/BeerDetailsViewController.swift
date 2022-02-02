//
//  BeerDetailsViewController.swift
//  Wallester iOS Test Task (Viper-UIKit)
//
//  Created by Igor Ševtšenko on 16.01.2022.
//

import UIKit

class BeerDetailsViewController: UIViewController, UITableViewDataSource, UITableViewDelegate{
    
    var presenter: BeerDetailsPresenterProtocol!
    @IBOutlet var beerDetails: BeerDetails!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        beerDetails.dataSource = self
        beerDetails.delegate = self
        
        //MARK: - Tableview
        setUpTableView()
        
        //MARK: - Navbar
        setUpNavBar()
        
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 4
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = beerDetails.dequeueReusableCell(withIdentifier: "BeerDetailsCell", for: indexPath) as! BeerDetailsCell
        
        cell.selectionStyle = .none
        cell.beerDetails.textAlignment = .center
        cell.beerDetails.numberOfLines = 2
        
        
        switch indexPath.row{
        case 0:
            cell.beerDetails.text = "Name: \(presenter.beerName())"
            
            return cell
        case 1:
            cell.beerDetails.text = "Alcohol: \(presenter.formattedABV())"
            return cell
        case 2:
            cell.beerDetails.text = "EBC: \(presenter.formattedEBC())"
            return cell
        case 3:
            cell.beerDetails.text = "IBU: \(presenter.formattedIBU())"
            return cell
        default:
            return cell
        }
    }

    //MARK: - Setting up Navigation Bar
    private func setUpNavBar(){
        title = presenter.beerName()

        let addToFavoritesButton = UIImage(systemName: SystemImages.FilledStar.rawValue)
        navigationItem.rightBarButtonItem = UIBarButtonItem(image: addToFavoritesButton, style: .plain, target: self, action: #selector(addOrRemoveFromFavorites))
        navigationItem.rightBarButtonItem?.tintColor = presenter.addToFavoriteButtonColor()
    }
    
    //MARK: - Setting up TableView
    private func setUpTableView(){
        beerDetails.isScrollEnabled = false
        let nib = UINib(nibName: "BeerDetailsCell", bundle: nil)
        self.beerDetails.register(nib, forCellReuseIdentifier: "BeerDetailsCell")
        
        
    }
    
    //MARK: - Add or remove beer from favorites
    @objc private func addOrRemoveFromFavorites(){
        presenter.addOrRemoveFromFavorites()
        navigationItem.rightBarButtonItem?.tintColor = presenter.addToFavoriteButtonColor()
    }
}
