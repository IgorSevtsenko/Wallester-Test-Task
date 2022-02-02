//
//  BeerCell.swift
//  Wallester iOS Test Task (Viper-UIKit)
//
//  Created by Igor Ševtšenko on 11.01.2022.
//

import UIKit

class BeerCell: UITableViewCell {
    
    @IBOutlet var beerName: UILabel!
    @IBOutlet var beerABV: UILabel!
    @IBOutlet var addToFavoritesButton: UIButton!
    
    var beer: Beer?
    weak var cellDelegate: BeerCellDelegate?
    
    //MARK: - Add or remove beer from favorites
    @IBAction func addOrRemoveFromFavorites(_ sender: Any){
        guard beer != nil else{
            print("Beer absent")
            return
        }
        cellDelegate?.addOrRemoveFromFavorites(self.beer!)
    }
    
}
