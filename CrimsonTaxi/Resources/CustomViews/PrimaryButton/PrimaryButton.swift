//
//  PrimaryButton.swift
//  CrimsonTaxi
//
//  Created by Dzakhon on 23/10/23.
//

import UIKit


class PrimaryButton: BaseUIView {
    
    @IBOutlet weak var selfView: UIView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var stackView: UIStackView!
    
    var tapAction: CommonAction?
    
    override func commonInit() {
        super.commonInit()
        addParent(customView: selfView)
        clearBackground()
        configure()
    }
    
    private func configure() {
        primaryButtonShadow()
        stackView.spacing = 0
        imageView.isHidden = true
        selfView.backgroundColor = Theme.current.primary
    }
    
    override func draw(_ rect: CGRect) {
        super.draw(rect)
        selfView.clip(radius: rect.height/4)
    }
    
    func set(image: UIImage?) {
        imageView.image = image
        imageView.tintColor = Theme.current.appWhite
    }
    
    func set(title: String?) {
        titleLabel.attributedText = Attr.create(text: title.nonNil,
                                                color: Theme.current.appWhite,
                                                font: .semibold,
                                                size: 17)
    }
    
}

extension PrimaryButton {
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesBegan(touches, with: event)
        fadeIn()
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
