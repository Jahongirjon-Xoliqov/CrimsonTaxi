//
//  InputFieldView.swift
//  CrimsonTaxi
//
//  Created by Dzakhon on 21/10/23.
//

import UIKit

class InputFieldView: BaseUIView {
    
    @IBOutlet weak var selfView: UIView!
    @IBOutlet weak var textField: UITextField!
    @IBOutlet weak var imageView: UIImageView!
    
    override func commonInit() {
        super.commonInit()
        addParent(customView: selfView)
        configure()
    }
    
    private func configure() {
        clearBackground()
        selfView.inactiveBorder()
        textField.placeholder(with: "Your Name")
        imageView.image = UIImage(named: "profile")
    }
    
    override func draw(_ rect: CGRect) {
        super.draw(rect)
        selfView.clip(radius: rect.height/4)
    }
    
}

extension InputFieldView: ThemeModifiable {
    func configureColor() {
        imageView.tintColor = Theme.current.supporting
        textField.placeholder(with: "You Name")
        selfView.inactiveBorder()
        selfView.backgroundColor = Theme.current.background
    }
}
