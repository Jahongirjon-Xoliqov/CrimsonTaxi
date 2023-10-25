//
//  PlaceDetailsView.swift
//  CrimsonTaxi
//
//  Created by Dzakhon on 25/10/23.
//

import UIKit

class PlaceDetailsView: BaseUIView {
    
    @IBOutlet weak var selfView: UIView!
    @IBOutlet weak var detailsLabel: UILabel!
    @IBOutlet weak var placeView: PlaceCircleView!
    
    override func commonInit() {
        super.commonInit()
        addParent(customView: selfView)
        clearBackground()
        configure()
    }
    
    private func configure() {
        selfView.backgroundColor = .clear
    }
    
    func set(place: String, details: String) {
        detailsLabel.attributedText = Attr.create(text: place+"\n"+details,
                                                  color: Theme.current.text,
                                                  font: .medium,
                                                  size: 15,
                                                  align: .left)
        .replace(text: details,
                 color: Theme.current.supporting,
                 font: .light,
                 size: 14,
                 align: .left)
    }
    
    func set(image: UIImage?) {
        placeView.set(image: image)
    }
    
}

