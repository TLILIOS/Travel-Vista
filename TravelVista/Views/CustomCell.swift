//
//  CustomCell.swift
//  TravelVista
//
//  Created by Amandine Cousin on 18/12/2023.
//

import UIKit

class CustomCell: UITableViewCell {
    @IBOutlet weak var rateLabel: UILabel!
    @IBOutlet weak var capitalLabel: UILabel!
    @IBOutlet weak var countryImageView: UIImageView!
    @IBOutlet weak var countryNameLabel: UILabel!
    
    var country: Country?
    
    // Fonction qui permet de configurer la cellule en fonction d'un Country
    func setUpCell(country: Country){
        self.countryImageView.layer.cornerRadius = self.countryImageView.frame.size.width / 2
        
        self.country = country
        self.countryNameLabel.text = country.name
        self.capitalLabel.text = country.capital
        self.countryImageView.image = UIImage(named: country.pictureName)
        self.rateLabel.text = String(country.rate)
    }
}
