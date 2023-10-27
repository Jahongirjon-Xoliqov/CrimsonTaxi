//
//  NavBackButton.swift
//  CrimsonTaxi
//
//  Created by Dzakhon on 20/10/23.
//

import UIKit

class NavBackButton: BaseUIView {
    
    @IBOutlet weak var selfView: UIView!
    @IBOutlet weak var imageView: UIImageView!
    
    var tapAction: CommonAction?
     
    override func commonInit() {
        super.commonInit()
        addParent(customView: selfView)
        configure()
    }
    
    private func configure() {
        applyShadow()
        configureColor()
        clearBackground()
        imageView.image = UIImage(named: "navBack")
    }
    
    override func draw(_ rect: CGRect) {
        super.draw(rect)
        selfView.clip(radius: rect.height/2)
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesBegan(touches, with: event)
        fadeIn(duration: 0.1)
    }
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesEnded(touches, with: event)
        fadeOut()
        tapAction?()
    }
    
    override func touchesCancelled(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesCancelled(touches, with: event)
        fadeOut()
    }
    
}

extension NavBackButton: ThemeModifiable {
    func configureColor() {
        selfView.backgroundColor = Theme.current.navigationControl
        imageView.tintColor = Theme.current.appWhite
    }
}
