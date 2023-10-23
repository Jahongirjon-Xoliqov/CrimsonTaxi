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
    
    private var image: UIImage?
    private var placeholderText: String?
    
    override func commonInit() {
        super.commonInit()
        addParent(customView: selfView)
        configure()
    }
    
    private func configure() {
        clearBackground()
        selfView.inactiveBorder()
    }
    
    override func draw(_ rect: CGRect) {
        super.draw(rect)
        selfView.clip(radius: rect.height/4)
    }
    
    func set(image: UIImage?) {
        self.image = image
        imageView.image = image
    }
    
    func set(placeholder: String?) {
        self.placeholderText = placeholder
        textField.placeholder(with: placeholder.nonNil)
    }
    
}

extension InputFieldView: ThemeModifiable {
    func configureColor() {
        selfView.inactiveBorder()
        imageView.tintColor = Theme.current.supporting
        textField.placeholder(with: placeholderText.nonNil)
        selfView.backgroundColor = Theme.current.background
    }
}
