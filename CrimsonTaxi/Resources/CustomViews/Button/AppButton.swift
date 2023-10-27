//
//  AppButton.swift
//  CrimsonTaxi
//
//  Created by Dzakhon on 26/10/23.
//

import UIKit

struct AttributedImage {
    var image: UIImage?
    var tintColor: UIColor?
    var backgroundColor: UIColor?
    var contentType: UIView.ContentMode
}

struct AttributedTitle {
    var text: String?
    var textColor: UIColor?
    var backgroundColor: UIColor?
    var alignment: NSTextAlignment?
    var attributes: NSAttributedString?
}

struct AttributedView {
    var color: UIColor?
    var shadow: AppShadow?
    var borderWidth: CGFloat?
    var borderColor: UIColor?
    var cornerRadius: CGFloat?
}

struct AppButtonConfiguration {
    var title: AttributedTitle?
    var image: AttributedImage?
    var background: AttributedView?
}

class AppButton: UIControl {
    
    lazy var imageView: UIImageView = {
        return UIImageView(frame: .zero)
    }()
    
    lazy var titleLabel: UILabel = {
        let lbl = UILabel(frame: .zero)
        lbl.numberOfLines = 0
        return lbl
    }()
    
    var configuration = AppButtonConfiguration()
    
    var touchBegan: CommonAction? {
        didSet {
            addTarget(self, 
                      action: #selector(touchDown),
                      for: .touchDown)
        }
    }
    
    var touchEnded: CommonAction? {
        didSet {
            addTarget(self, 
                      action: #selector(touchUpInside),
                      for: .touchUpInside)
        }
    }
    
    var touchCancelled: CommonAction? {
        didSet {
            addTarget(self, 
                      action: #selector(touchCancel),
                      for: .touchDragExit)
        }
    }
    
    init(configuration: AppButtonConfiguration) {
        self.configuration = configuration
        super.init(frame: .zero)
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        addSubview(imageView)
        addSubview(titleLabel)
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        addSubview(imageView)
        addSubview(titleLabel)
    }
    
    override func draw(_ rect: CGRect) {
        super.draw(rect)
        if let radius = configuration.background?.cornerRadius {
            clip(radius: bounds.height * radius)
        }
    }
    
    func configure() {
        
        if let imageConfig = configuration.image {
            imageView.image = imageConfig.image
            imageView.tintColor = imageConfig.tintColor
            imageView.contentMode = imageConfig.contentType
        }
        
        if let titleConfig = configuration.title {
            if let attrs = titleConfig.attributes {
                titleLabel.attributedText = attrs
            } else {
                titleLabel.text = titleConfig.text
                titleLabel.textColor = titleConfig.textColor
                titleLabel.textAlignment = titleConfig.alignment ?? .center
            }
        }
        
        if let backgroundConfig = configuration.background {
            backgroundColor = backgroundConfig.color
            layer.borderColor = backgroundConfig.borderColor?.cgColor
            layer.borderWidth = backgroundConfig.borderWidth ?? 0
            
            if let shadow = backgroundConfig.shadow {
                applyShadow(shadow)
            }
            
            if let _ = backgroundConfig.cornerRadius {
                backgroundColor = .clear
                layer.backgroundColor = backgroundConfig.color?.cgColor
                setNeedsDisplay()
            }
        }
        
    }
    
    @objc private func touchUpInside() {
        touchEnded?()
    }
    
    @objc private func touchDown() {
        touchBegan?()
    }
    
    @objc private func touchCancel() {
        touchCancelled?()
    }
    
    func shadowIdentity() {
        if let shadow = configuration.background?.shadow {
            applyShadow(shadow)
        }
    }
    
}

extension AppButton: ThemeModifiable {
    
    func configureColor() {
        self.configure()
    }
    
}

extension AppButton {
    
    func profileOption(title: String, image: UIImage?) {
        
        let background = AttributedView(borderWidth: 0.4,
                                        borderColor: Theme.current.supporting,
                                        cornerRadius: 0.25)
        
        let titleAttrs = Attr.create(text: title,
                                     color: Theme.current.supporting,
                                     font: .regular,
                                     size: 14,
                                     align: .left)
        
        let imageAttr = AttributedImage(image: image,
                                        tintColor: Theme.current.supporting,
                                        contentType: .scaleToFill)
        
        let title = AttributedTitle(attributes: titleAttrs)
        
        let configurations = AppButtonConfiguration(title: title,
                                                    image: imageAttr,
                                                    background: background)
        
        self.configuration = configurations
        
        self.configure()
        
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.heightAnchor.constraint(equalTo: heightAnchor, multiplier: 0.38).isActive = true
        imageView.widthAnchor.constraint(equalTo: imageView.heightAnchor, multiplier: 1).isActive = true
        imageView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 30).isActive = true
        imageView.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
        
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        titleLabel.topAnchor.constraint(equalTo: topAnchor).isActive = true
        titleLabel.leadingAnchor.constraint(equalTo: imageView.trailingAnchor, constant: 25).isActive = true
        titleLabel.bottomAnchor.constraint(equalTo: bottomAnchor).isActive = true
        titleLabel.trailingAnchor.constraint(equalTo: trailingAnchor).isActive = true
        
    }
    
    func actionButton(title: String, image: UIImage?, color: UIColor?) {
        
        let titleAttrs = Attr.create(text: title, 
                                     color: color ?? Theme.current.text,
                                     font: .regular,
                                     size: 14,
                                     align: .left)
        
        let title = AttributedTitle(attributes: titleAttrs)
        
        let image = AttributedImage(image: image,
                                    tintColor: color,
                                    contentType: .scaleToFill)
        
        let background = AttributedView(borderWidth: 1,
                                        borderColor: color,
                                        cornerRadius: 0.25)
        
        configuration = AppButtonConfiguration(title: title,
                                               image: image,
                                               background: background)
        
        self.configure()
        
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.heightAnchor.constraint(equalTo: heightAnchor, multiplier: 0.38).isActive = true
        imageView.widthAnchor.constraint(equalTo: imageView.heightAnchor, multiplier: 1).isActive = true
        imageView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 10).isActive = true
        imageView.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
        
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        titleLabel.topAnchor.constraint(equalTo: topAnchor).isActive = true
        titleLabel.leadingAnchor.constraint(equalTo: imageView.trailingAnchor, constant: 10).isActive = true
        titleLabel.bottomAnchor.constraint(equalTo: bottomAnchor).isActive = true
        titleLabel.trailingAnchor.constraint(equalTo: trailingAnchor).isActive = true
        
    }
    
}
