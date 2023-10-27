//
//  AppButton.swift
//  CrimsonTaxi
//
//  Created by Dzakhon on 26/10/23.
//

import UIKit

protocol AppShadow {
    var path: CGPath? { get set }
    var color: UIColor { get set }
    var offset: CGSize { get set }
    var radius: CGFloat { get set }
    var opacity: CGFloat { get set }
}

struct PrimaryShadow: AppShadow {
    var path: CGPath?
    var radius: CGFloat = 16
    var opacity: CGFloat = 0.3
    var color: UIColor = Theme.current.appBlack
    var offset: CGSize = CGSize(width: 0, height: 5)
}

struct SecondaryShadow: AppShadow {
    var path: CGPath?
    var radius: CGFloat = 10
    var opacity: CGFloat = 0.4
    var color: UIColor = Theme.current.appBlack
    var offset: CGSize = CGSize(width: 0, height: 4)
}

enum AppButtonAlignment {
    case leading
    case center
    case trailing
    case reversedLeading
    case reversedCenter
    case reversedTrailing
}

struct AppButtonConfiguration {
    var title: AttributedTitle?
    var image: AttributedImage?
    var background: AttributedView?
}

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
    
    func makePrimary() {
        
        let shadow = PrimaryShadow(color: Theme.current.primary)
        
        let background = AttributedView(color: Theme.current.primary, 
                                        shadow: shadow,
                                        cornerRadius: 0.25)
        
        let titleAttrs = Attr.create(text: "Next",
                                     color: Theme.current.appWhite,
                                     font: .semibold,
                                     size: 17)
        
        let title = AttributedTitle(attributes: titleAttrs)
        
        let configurations = AppButtonConfiguration(title: title, background: background)
        
        self.configuration = configurations
        
        self.configure()
        
        imageView.isHidden = true
        
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        titleLabel.topAnchor.constraint(equalTo: topAnchor).isActive = true
        titleLabel.leadingAnchor.constraint(equalTo: leadingAnchor).isActive = true
        titleLabel.bottomAnchor.constraint(equalTo: bottomAnchor).isActive = true
        titleLabel.trailingAnchor.constraint(equalTo: trailingAnchor).isActive = true
        
    }
    
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
    
    func activeButton(title: String, image: UIImage?) {
        
        let titleAttrs = Attr.create(text: title, color: Theme.current.error,
                                     font: .regular,
                                     size: 14,
                                     align: .left)
        
        let title = AttributedTitle(attributes: titleAttrs)
        
        let image = AttributedImage(image: image, 
                                    tintColor: Theme.current.error,
                                    contentType: .scaleToFill)
        
        let background = AttributedView(borderWidth: 1,
                                        borderColor: Theme.current.error,
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

extension AppButton: ThemeModifiable {
    func configureColor() {
        self.configure()
    }
}
