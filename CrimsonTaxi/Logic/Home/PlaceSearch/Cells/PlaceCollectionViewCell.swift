//
//  PlaceCollectionViewCell.swift
//  CrimsonTaxi
//
//  Created by Dzakhon on 30/10/23.
//

import UIKit

class PlaceCollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var placeDetailsView: PlaceDetailsView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        backgroundColor = .clear
        contentView.backgroundColor = .clear
    }
    
    func setData() {
        placeDetailsView.set(image: UIImage(named: "locFill"))
        placeDetailsView.set(place: "Startbucks", details: "4202 Tyler Street, VA\n17")
    }

}
