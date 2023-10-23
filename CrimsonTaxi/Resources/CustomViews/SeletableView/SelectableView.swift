//
//  SelectableView.swift
//  CrimsonTaxi
//
//  Created by Dzakhon on 23/10/23.
//

import UIKit

class SelectableView: BaseUIView {
    
    enum SelectableViewState {
        case seleted
        case `default`
        @discardableResult
        mutating func togle() -> Self {
            switch self {
            case .seleted: self = .default
            case .default: self = .seleted
            }
            return self
        }
    }
    
    @IBOutlet weak var selfView: UIView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var stackView: UIStackView!
    
    private var title: String?
    var state: SelectableViewState = .default
    
    var becomeActiveAction: (CommonAction)?
    var becomeInactiveAction: (CommonAction)?
    
    override func commonInit() {
        super.commonInit()
        addParent(customView: selfView)
        clearBackground()
        configure()
    }
    
    func configure() {
        switch state {
        case .seleted:
            selfView.clearBorder()
            primaryButtonShadow()
            imageView.tintColor = .white
            selfView.backgroundColor = Theme.current.primary
            titleLabel.attributedText = Attr.create(text: title.nonNil,
                                                    color: .white,
                                                    font: .regular,
                                                    size: 14)
        case .default:
            clearShadow()
            selfView.border()
            imageView.tintColor = Theme.current.supporting
            selfView.backgroundColor = Theme.current.background
            titleLabel.attributedText = Attr.create(text: title.nonNil,
                                                    color: Theme.current.supporting,
                                                    font: .regular,
                                                    size: 14)
        }
    }
    
    override func draw(_ rect: CGRect) {
        super.draw(rect)
        selfView.clip(radius: rect.height/4)
    }
    
    func set(image: UIImage?) {
        imageView.image = image
    }
    
    func set(title: String?) {
        self.title = title
        configure()
    }
    
    func set(state: SelectableViewState) {
        self.state = state
        configure()
    }
    
}

extension SelectableView: ThemeModifiable {
    func configureColor() {
        configure()
    }
}

extension SelectableView {
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesBegan(touches, with: event)
        fadeIn()
    }
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesEnded(touches, with: event)
        triggerAction()
    }
    
    override func touchesCancelled(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesCancelled(touches, with: event)
        triggerAction()
    }
    
    private func triggerAction() {
        fadeOut()
        if state == .default {
            state = .seleted
            becomeActiveAction?()
        } else {
            state = .default
            becomeInactiveAction?()
        }
        
    }
    
}
