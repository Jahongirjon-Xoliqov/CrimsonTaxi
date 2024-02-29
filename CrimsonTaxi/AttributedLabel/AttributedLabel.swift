//
//  AttributedLabel.swift
//  CrimsonTaxi
//
//  Created by Dzakhon on 29/02/24.
//

import UIKit

final class AttributedLabel: UILabel {
    
    func set(attribute: NSAttributedString) {
        attributedText = attribute
    }
    
    func append(attribute: NSAttributedString) {
        guard let existingAttributes = attributedText else {
            attributedText = attribute
            return
        }
        let attributesContainer = NSMutableAttributedString(attributedString: existingAttributes)
        attributesContainer.append(attribute)
        attributedText = attributesContainer
    }
    
    func replace(in text: String, with attribute: NSAttributedString) {
        guard let existingAttributes = attributedText else {
            attributedText = attribute
            return
        }
        let replacingTextRange = NSRange.init(location: 0, length: text.count)
        let wholeTextRange = (existingAttributes.string as NSString).range(of: text)
        let attributesContainer = NSMutableAttributedString(attributedString: existingAttributes)
        let newAttributes = attribute.attributes(at: 0, longestEffectiveRange: nil, in: replacingTextRange)
        attributesContainer.addAttributes(newAttributes, range: wholeTextRange)
        attributedText = attributesContainer
    }
    
    enum ImageAlignment {
        case imageTopToFontTop
        case imageCenterToFontCenter
        case imageBottomToFontBottom
        case imageBottomToFontBaseline
    }
    
    func append(image: UIImage, color: UIColor, size: CGSize, attachTo attachment: ImageAlignment) {
        
        let font = Font.MONTSERRAT_REGULAR.size(50)
        let imageAttachment = NSTextAttachment(image: image.withTintColor(color))
        
        if attachment == .imageCenterToFontCenter {
            let fontHeight = font.ascender + font.descender
            let middleOfFontPoint = fontHeight/2
            let originPointY = middleOfFontPoint-size.height/2
            imageAttachment.bounds = CGRect(x: 0,
                                            y: originPointY,
                                            width: size.width,
                                            height: size.height)
        }
        
        if attachment == .imageTopToFontTop {
            let originPointY: CGFloat = font.ascender + font.descender - size.height
            imageAttachment.bounds = CGRect(x: 0,
                                            y: originPointY,
                                            width: size.width,
                                            height: size.height)
        }
        
        if attachment == .imageBottomToFontBottom {
            let originPointY: CGFloat = font.descender
            imageAttachment.bounds = CGRect(x: 0,
                                            y: originPointY,
                                            width: size.width,
                                            height: size.height)
        }
        
        if attachment == .imageBottomToFontBaseline {
            imageAttachment.bounds = CGRect(x: 0,
                                            y: 0,
                                            width: size.width,
                                            height: size.height)
        }
        
        let imageAttributes = NSAttributedString(attachment: imageAttachment)
        
        guard let existingAttributes = attributedText else {
            attributedText = imageAttributes
            return
        }
        
        let attributesContainer = NSMutableAttributedString(attributedString: existingAttributes)
        attributesContainer.append(imageAttributes)
        attributedText = attributesContainer
        
    }
    
}










struct Some {
    func method() {
        //let label = AttributedLabel()
        //let builder = AttributedLabelBuilder()
//        lable.text("some text")
//             .text("new text", attributes: Attr)
//             .image(UIImage, config: Config)
//
//        lable.append(attr)
//            .append(attr)
//            .append(attr)
//            .append(Attr)
//        
//        label.set(attr)
//        label.append()
//        lable.append()
//        label.replace()
//
        
        /// <image> - image format
//        let a = """
//        <image>
//        
//        some texts that should show <image>
//        image and be<image>clickable and linkable
//        """
//        Attr(a, firstImage, secondImage, thirdImage)
    }
}
