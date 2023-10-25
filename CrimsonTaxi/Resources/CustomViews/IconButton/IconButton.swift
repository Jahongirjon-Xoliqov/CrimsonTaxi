//
//  IconButton.swift
//  CrimsonTaxi
//
//  Created by Dzakhon on 25/10/23.
//

import UIKit

class IconButton: BaseUIView {
    
    @IBOutlet weak var selfView: UIView!
    @IBOutlet weak var imageView: UIImageView!
    
    private var backColor: UIColor? = .clear
    private var image: UIImage? = UIImage(named: "edit")
    private var imageTintColor: UIColor? = Theme.current.primary

    
    var iconTintColor: UIColor? {
        willSet {
            imageTintColor = newValue
            imageView.tintColor = newValue
        }
    }
    
    var selfBackgroundColor: UIColor? {
        willSet {
            backColor = newValue
            guard let selfView else { return }
            selfView.backgroundColor = newValue
        }
    }
    
    var isCircle: Bool? {
        didSet {
            setNeedsDisplay()
        }
    }
    
    var tapAction: CommonAction?
    
    override func commonInit() {
        super.commonInit()
        addParent(customView: selfView)
        clearBackground()
        configure()
    }
    
    private func configure() {
        imageView.tintColor = imageTintColor
        selfView.backgroundColor = backColor
    }
    
    func set(image: UIImage?) {
        self.image = image
        imageView.image = image
    }
    
    override func draw(_ rect: CGRect) {
        super.draw(rect)
        guard let isCircle else { return }
        selfView.clipsToBounds = isCircle
        selfView.clip(radius: selfView.bounds.height/2)
    }
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesEnded(touches, with: event)
        tapAction?()
    }
    
}
