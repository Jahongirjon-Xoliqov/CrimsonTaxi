//
//  SearchFieldView.swift
//  CrimsonTaxi
//
//  Created by Dzakhon on 24/10/23.
//

import UIKit

class SearchFieldView: BaseUIView {
    
    @IBOutlet weak var selfView: UIView!
    @IBOutlet weak var textField: UITextField!
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var mapTappableView: UIView!
    
    private var image: UIImage?
    private var placeholderText: String?
    
    var endSearchAction: CommonAction?
    var beginSearchAction: CommonAction?
    var didTapMapAction: CommonAction?
    
    override func commonInit() {
        super.commonInit()
        addParent(customView: selfView)
        configure()
    }
    
    private func configure() {
        clearBackground()
        selfView.inactiveBorder()
        textField.delegate = self
        mapTappableView.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(mapTapped)))
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
    
    @objc private func mapTapped() {
        didTapMapAction?()
    }
    
}

extension SearchFieldView: ThemeModifiable {
    func configureColor() {
        selfView.inactiveBorder()
        textField.textColor = Theme.current.text
        imageView.tintColor = Theme.current.supporting
        textField.placeholder(with: placeholderText.nonNil)
        selfView.backgroundColor = Theme.current.background
    }
}

extension SearchFieldView: UITextFieldDelegate {
    func textFieldDidBeginEditing(_ textField: UITextField) {
        beginSearchAction?()
    }
    func textFieldDidEndEditing(_ textField: UITextField) {
        endSearchAction?()
    }
}
