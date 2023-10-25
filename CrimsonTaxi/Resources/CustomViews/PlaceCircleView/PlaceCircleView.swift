//
//  PlaceCircleView.swift
//  CrimsonTaxi
//
//  Created by Dzakhon on 25/10/23.
//

import UIKit

class PlaceCircleView: BaseUIView {
    
    @IBOutlet weak var selfView: UIView!
    @IBOutlet weak var containerView: UIView!
    @IBOutlet weak var imageView: UIImageView!
    
    override func commonInit() {
        super.commonInit()
        addParent(customView: selfView)
        clearBackground()
        configure()
    }
    
    private func configure() {
        set(image: UIImage(named: "target"))
        selfView.backgroundColor = Theme.current.primary.withAlphaComponent(0.3)
        containerView.backgroundColor = Theme.current.primary
    }
    
    override func draw(_ rect: CGRect) {
        super.draw(rect)
        selfView.clip(radius: rect.height/2)
        containerView.clip(radius: containerView.frame.height/2)
    }
    
    func set(image: UIImage?) {
        imageView.image = image
        imageView.tintColor = Theme.current.appBlack
    }
    
}
