//
//  NSAttributedString+Extensions.swift
//  CrimsonTaxi
//
//  Created by Dzakhon on 21/10/23.
//

import UIKit

typealias Attr = NSAttributedString

extension NSAttributedString {
    convenience init(text: String,
                     color: UIColor,
                     font: Font,
                     size: CGFloat) {
        let attributes: [NSAttributedString.Key : Any] = [
            .foregroundColor: color,
            .font: font.size(size)
        ]
        self.init(string: text,
                  attributes: attributes)
    }
}


extension NSAttributedString {
    /**
    Returns a new mutable string with characters from a given character set removed.

    See http://panupan.com/2012/06/04/trim-leading-and-trailing-whitespaces-from-nsmutableattributedstring/

    - Parameters:
      - charSet: The character set with which to remove characters.
    - returns: A new string with the matching characters removed.
    */
    public func trimmingCharacters(in set: CharacterSet) -> NSAttributedString {
        let modString = NSMutableAttributedString(attributedString: self)
        modString.trimCharacters(in: set)
        return NSAttributedString(attributedString: modString)
    }
}


extension NSMutableAttributedString {
    /**
    Modifies this instance of the string to remove characters from a given character set from
    the beginning and end of the string.

    See http://panupan.com/2012/06/04/trim-leading-and-trailing-whitespaces-from-nsmutableattributedstring/

    - Parameters:
      - charSet: The character set with which to remove characters.
    */
    public func trimCharacters(in set: CharacterSet) {
        var range = (string as NSString).rangeOfCharacter(from: set)

        // Trim leading characters from character set.
        while range.length != 0 && range.location == 0 {
            replaceCharacters(in: range, with: "")
            range = (string as NSString).rangeOfCharacter(from: set)
        }

        // Trim trailing characters from character set.
        range = (string as NSString).rangeOfCharacter(from: set, options: .backwards)
        while range.length != 0 && NSMaxRange(range) == length {
            replaceCharacters(in: range, with: "")
            range = (string as NSString).rangeOfCharacter(from: set, options: .backwards)
        }
    }

}


extension NSMutableAttributedString {
    
    fileprivate var range: NSRange {
        return NSRange(location: 0, length: length)
    }
    
    fileprivate var paragraphStyle: NSMutableParagraphStyle? {
        return attributes(at: 0, effectiveRange: nil)[NSAttributedString.Key.paragraphStyle] as? NSMutableParagraphStyle
    }
    
}

// MARK: - Font

extension NSMutableAttributedString {
    /**
     Applies a font to the entire string.
     
     - parameter font: The font.
     */
    @discardableResult
    public func font(_ font: UIFont) -> Self {
        addAttribute(NSAttributedString.Key.font, value: font, range: range)
        return self
    }
    
    /**
     Applies a font to the entire string.
     
     - parameter name: The font name.
     - parameter size: The font size.
     
     Note: If the specified font name cannot be loaded, this method will fallback to the system font at the specified size.
     */
    @discardableResult
    public func font(name: String, size: CGFloat) -> Self {
        addAttribute(NSAttributedString.Key.font, value: UIFont(name: name, size: size) ?? .systemFont(ofSize: size), range: range)
        return self
    }
}

// MARK: - Paragraph style

extension NSMutableAttributedString {
    
    /**
     Applies a text alignment to the entire string.
     
     - parameter alignment: The text alignment.
     */
    @discardableResult
    public func alignment(_ alignment: NSTextAlignment) -> Self {
        let paragraphStyle = self.paragraphStyle ?? NSMutableParagraphStyle()
        paragraphStyle.alignment = alignment
        
        addAttribute(NSAttributedString.Key.paragraphStyle, value: paragraphStyle, range: range)
        
        return self
    }
    
    /**
     Applies line spacing to the entire string.
     
     - parameter lineSpacing: The line spacing amount.
     */
    @discardableResult
    public func lineSpacing(_ lineSpacing: CGFloat) -> Self {
        let paragraphStyle = self.paragraphStyle ?? NSMutableParagraphStyle()
        paragraphStyle.lineSpacing = lineSpacing
        
        addAttribute(NSAttributedString.Key.paragraphStyle, value: paragraphStyle, range: range)
        
        return self
    }
    
    /**
     Applies paragraph spacing to the entire string.
     
     - parameter paragraphSpacing: The paragraph spacing amount.
     */
    @discardableResult
    public func paragraphSpacing(_ paragraphSpacing: CGFloat) -> Self {
        let paragraphStyle = self.paragraphStyle ?? NSMutableParagraphStyle()
        paragraphStyle.paragraphSpacing = paragraphSpacing
        
        addAttribute(NSAttributedString.Key.paragraphStyle, value: paragraphStyle, range: range)
        
        return self
    }
    
    /**
     Applies a line break mode to the entire string.
     
     - parameter mode: The line break mode.
     */
    @discardableResult
    public func lineBreak(_ mode: NSLineBreakMode) -> Self {
        let paragraphStyle = self.paragraphStyle ?? NSMutableParagraphStyle()
        paragraphStyle.lineBreakMode = mode
        
        addAttribute(NSAttributedString.Key.paragraphStyle, value: paragraphStyle, range: range)
        
        return self
    }

    /**
     Applies a line height multiplier to the entire string.
     
     - parameter multiple: The line height multiplier.
     */
    @discardableResult
    public func lineHeight(multiple: CGFloat) -> Self {
        let paragraphStyle = self.paragraphStyle ?? NSMutableParagraphStyle()
        paragraphStyle.lineHeightMultiple = multiple
        
        addAttribute(NSAttributedString.Key.paragraphStyle, value: paragraphStyle, range: range)
        
        return self
    }
    
    /**
     Applies a first line head indent to the string.
     
     - parameter indent: The first line head indent amount.
     */
    @discardableResult
    public func firstLineHeadIndent(_ indent: CGFloat) -> Self {
        let paragraphStyle = self.paragraphStyle ?? NSMutableParagraphStyle()
        paragraphStyle.firstLineHeadIndent = indent
        
        addAttribute(NSAttributedString.Key.paragraphStyle, value: paragraphStyle, range: range)
        
        return self
    }
    
    /**
     Applies a head indent to the string.
     
     - parameter indent: The head indent amount.
     */
    @discardableResult
    public func headIndent(_ indent: CGFloat) -> Self {
        let paragraphStyle = self.paragraphStyle ?? NSMutableParagraphStyle()
        paragraphStyle.headIndent = indent
        
        addAttribute(NSAttributedString.Key.paragraphStyle, value: paragraphStyle, range: range)
        
        return self
    }
    
    /**
     Applies a tail indent to the string.
     
     - parameter indent: The tail indent amount.
     */
    @discardableResult
    public func tailIndent(_ indent: CGFloat) -> Self {
        let paragraphStyle = self.paragraphStyle ?? NSMutableParagraphStyle()
        paragraphStyle.tailIndent = indent
        
        addAttribute(NSAttributedString.Key.paragraphStyle, value: paragraphStyle, range: range)
        
        return self
    }

    /**
     Applies a minimum line height to the entire string.
     
     - parameter height: The minimum line height.
     */
    @discardableResult
    public func minimumLineHeight(_ height: CGFloat) -> Self {
        let paragraphStyle = self.paragraphStyle ?? NSMutableParagraphStyle()
        paragraphStyle.minimumLineHeight = height
        
        addAttribute(NSAttributedString.Key.paragraphStyle, value: paragraphStyle, range: range)
        
        return self
    }
    
    /**
     Applies a maximum line height to the entire string.
     
     - parameter height: The maximum line height.
     */
    @discardableResult
    public func maximumLineHeight(_ height: CGFloat) -> Self {
        let paragraphStyle = self.paragraphStyle ?? NSMutableParagraphStyle()
        paragraphStyle.maximumLineHeight = height
        
        addAttribute(NSAttributedString.Key.paragraphStyle, value: paragraphStyle, range: range)
        
        return self
    }
    
    /**
     Applies a base writing direction to the entire string.
     
     - parameter direction: The base writing direction.
     */
    @discardableResult
    public func baseWritingDirection(_ direction: NSWritingDirection) -> Self {
        let paragraphStyle = self.paragraphStyle ?? NSMutableParagraphStyle()
        paragraphStyle.baseWritingDirection = direction
        
        addAttribute(NSAttributedString.Key.paragraphStyle, value: paragraphStyle, range: range)
        
        return self
    }
    
    /**
     Applies a paragraph spacing before amount to the string.
     
     - parameter spacing: The distance between the paragraph’s top and the beginning of its text content.
     */
    @discardableResult
    public func paragraphSpacingBefore(_ spacing: CGFloat) -> Self {
        let paragraphStyle = self.paragraphStyle ?? NSMutableParagraphStyle()
        paragraphStyle.paragraphSpacingBefore = spacing
        
        addAttribute(NSAttributedString.Key.paragraphStyle, value: paragraphStyle, range: range)
        
        return self
    }
}

// MARK: - Foreground color

extension NSMutableAttributedString {
    /**
     Applies the given color over the entire string, as the foreground color.
     
     - parameter color: The color to apply.
     */
    @discardableResult @nonobjc
    public func color(_ color: UIColor, alpha: CGFloat = 1) -> Self {
        addAttribute(NSAttributedString.Key.foregroundColor, value: color.withAlphaComponent(alpha), range: range)
        return self
    }
    
    /**
     Applies the given color over the entire string, as the foreground color.
     
     - parameter color: The color to apply.
     */
    @discardableResult
    public func color(red: CGFloat, green: CGFloat, blue: CGFloat, alpha: CGFloat = 1) -> Self {
        addAttribute(NSAttributedString.Key.foregroundColor, value: UIColor(red: red, green: green, blue: blue, alpha: alpha), range: range)
        return self
    }
    
    /**
     Applies the given color over the entire string, as the foreground color.
     
     - parameter color: The color to apply.
     */
    @discardableResult
    public func color(white: CGFloat, alpha: CGFloat = 1) -> Self {
        addAttribute(NSAttributedString.Key.foregroundColor, value: UIColor(white: white, alpha: alpha), range: range)
        return self
    }
    
    /**
     Applies the given color over the entire string, as the foreground color.
     
     - parameter color: The color to apply.
     */
    @discardableResult @nonobjc
    public func color(_ hex: Int, alpha: CGFloat = 1) -> Self {
        addAttribute(NSAttributedString.Key.foregroundColor, value: UIColor(rgb: hex, alpha: alpha), range: range)
        return self
    }
}

// MARK: - Underline, kern, strikethrough, stroke, shadow, text effect

extension NSMutableAttributedString {
    /**
     Applies a single underline under the entire string.
     
     - parameter style: The `NSUnderlineStyle` to apply. Defaults to `.styleSingle`.
     */
    @discardableResult
    public func underline(style: NSUnderlineStyle = .single, color: UIColor? = nil) -> Self {
        addAttribute(NSAttributedString.Key.underlineStyle, value: style.rawValue, range: range)
        
        if let color = color {
            addAttribute(NSAttributedString.Key.underlineColor, value: color, range: range)
        }
        
        return self
    }

    /**
     Applies a kern (spacing) value to the entire string.
     
     - parameter value: The space between each character in the string.
     */
    @discardableResult
    public func kern(_ value: CGFloat) -> Self {
        addAttribute(NSAttributedString.Key.kern, value: value, range: range)
        return self
    }
    
    /**
     Applies a strikethrough to the entire string.
     
     - parameter style: The `NSUnderlineStyle` to apply. Defaults to `.styleSingle`.
     - parameter color: The underline color. Defaults to the color of the text.
     */
    @discardableResult
    public func strikethrough(style: NSUnderlineStyle = .single, color: UIColor? = nil) -> Self {
        addAttribute(NSAttributedString.Key.strikethroughStyle, value: style.rawValue, range: range)
        
        if let color = color {
            addAttribute(NSAttributedString.Key.strikethroughColor, value: color, range: range)
        }
        
        return self
    }
    
    /**
     Applies a stroke to the entire string.
     
     - parameter color: The stroke color.
     - parameter width: The stroke width.
     */
    @discardableResult
    public func stroke(color: UIColor, width: CGFloat) -> Self {
        addAttributes([
            NSAttributedString.Key.strokeColor : color,
            NSAttributedString.Key.strokeWidth : width
        ], range: range)
        
        return self
    }
    
    /**
     Applies a shadow to the entire string.
     
     - parameter color: The shadow color.
     - parameter radius: The shadow blur radius.
     - parameter offset: The shadow offset.
     */
    @discardableResult
    public func shadow(color: UIColor, radius: CGFloat, offset: CGSize) -> Self {
        let shadow = NSShadow()
        shadow.shadowColor = color
        shadow.shadowBlurRadius = radius
        shadow.shadowOffset = offset
        
        addAttribute(NSAttributedString.Key.shadow, value: shadow, range: range)
        
        return self
    }
    
}

// MARK: - Background color

extension NSMutableAttributedString {
    
    /**
     Applies a background color to the entire string.
     
     - parameter color: The color to apply.
     */
    @discardableResult @nonobjc
    public func backgroundColor(_ color: UIColor, alpha: CGFloat = 1) -> Self {
        addAttribute(NSAttributedString.Key.backgroundColor, value: color.withAlphaComponent(alpha), range: range)
        return self
    }
    
    /**
     Applies a background color to the entire string.
     
     - parameter red: The red color component.
     - parameter green: The green color component.
     - parameter blue: The blue color component.
     - parameter alpha: The alpha component.
     */
    @discardableResult
    public func backgroundColor(red: CGFloat, green: CGFloat, blue: CGFloat, alpha: CGFloat = 1) -> Self {
        addAttribute(NSAttributedString.Key.backgroundColor, value: UIColor(red: red, green: green, blue: blue, alpha: alpha), range: range)
        return self
    }
    
    /**
     Applies a background color to the entire string.
     
     - parameter white: The white color component.
     - parameter alpha: The alpha component.
     */
    @discardableResult
    public func backgroundColor(white: CGFloat, alpha: CGFloat = 1) -> Self {
        addAttribute(NSAttributedString.Key.backgroundColor, value: UIColor(white: white, alpha: alpha), range: range)
        return self
    }
    
    /**
     Applies a background color to the entire string.
     
     - parameter hex: The hex color value.
     - parameter alpha: The alpha component.
     */
    @discardableResult @nonobjc
    public func backgroundColor(_ hex: Int, alpha: CGFloat = 1) -> Self {
        addAttribute(NSAttributedString.Key.backgroundColor, value: UIColor(rgb: hex, alpha: alpha), range: range)
        return self
    }
}

extension NSMutableAttributedString {
    
    /**
     Applies a baseline offset to the entire string.
     
     - parameter offset: The offset value.
     */
    @discardableResult
    public func baselineOffset(_ offset: Float) -> Self {
        addAttribute(NSAttributedString.Key.baselineOffset, value: NSNumber(value: offset), range: range)
        return self
    }
}

public func +(lhs: NSMutableAttributedString, rhs: NSAttributedString) -> NSMutableAttributedString {
    let lhs = NSMutableAttributedString(attributedString: lhs)
    lhs.append(rhs)
    return lhs
}

public func +=(lhs: NSMutableAttributedString, rhs: NSAttributedString) {
    lhs.append(rhs)
}


extension NSMutableAttributedString {
    
    func replace(text: String,
                 color: UIColor,
                 font: Font,
                 size: CGFloat,
                 align: NSTextAlignment = .center,
                 lineSpacing: CGFloat = 0,
                 underline: Bool = false,
                 striked: Bool = false) -> NSMutableAttributedString {
        
        let newAttributedString = NSMutableAttributedString(string: text,
                                                            attributes: [NSAttributedString.Key.foregroundColor: color,
                                                                         NSAttributedString.Key.font: font .size(size)])
        if let range = self.string.range(of: text) {
            let nsRange = NSRange(range, in: self.string)
            
            self.replaceCharacters(in: nsRange, with: newAttributedString)
            
            if underline {
                self.addAttribute(NSAttributedString.Key.underlineStyle,
                                     value: NSUnderlineStyle.single.rawValue, range: NSRange(range, in: self.string))
            }
            
            if striked {
                self.addAttribute(NSAttributedString.Key.strikethroughStyle,
                                     value: NSUnderlineStyle.single.rawValue, range: NSRange(range, in: self.string))
            }

            let paragraphStyle = NSMutableParagraphStyle()
            paragraphStyle.alignment = align
            paragraphStyle.lineSpacing = lineSpacing
            
            self.addAttribute(NSAttributedString.Key.paragraphStyle, value: paragraphStyle,
                                 range: NSRange(range, in: self.string))
            
        }
        
        return self
        
    }
    
}

extension NSAttributedString {
    
    static func create(text: String,
                       color: UIColor,
                       font: Font,
                       size: CGFloat,
                       align: NSTextAlignment = .center,
                       letterSpacing: CGFloat = 0,
                       lineSpacing: CGFloat = 0 ,
                       lineBreakMode: NSLineBreakMode = .byWordWrapping,
                       underline: Bool = false,
                       striked: Bool = false) -> NSMutableAttributedString {
        
        if text.isEmpty {
            return NSMutableAttributedString(string: text)
        }
        
        let attributedText = NSMutableAttributedString(string: text,
                                                       attributes: [NSAttributedString.Key.font: font.size(size),
                                                                    NSAttributedString.Key.foregroundColor: color,
                                                                    .kern: letterSpacing])
        
        let paragraphStyle = NSMutableParagraphStyle()
        paragraphStyle.alignment = align
        paragraphStyle.lineSpacing = lineSpacing
        paragraphStyle.lineBreakMode = lineBreakMode
        
        let lineRange = NSRange(location: 0, length: attributedText.length)
        attributedText.addAttribute(NSAttributedString.Key.paragraphStyle,
                                    value: paragraphStyle,
                                    range: lineRange)
        
        if underline {
            attributedText.addAttribute(NSAttributedString.Key.underlineStyle, value: NSUnderlineStyle.single.rawValue, range: lineRange)
        }
        
        if striked {
            attributedText.addAttribute(NSAttributedString.Key.strikethroughStyle, value: NSUnderlineStyle.single.rawValue, range: lineRange)
        }
        
        return attributedText
        
    }
}
