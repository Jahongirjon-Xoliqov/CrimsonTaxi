//
//  UITextField+Extensions.swift
//  CrimsonTaxi
//
//  Created by Dzakhon on 21/10/23.
//

import UIKit

extension UITextField {
    
    func placeholder(with text: String,
                     color: UIColor = Theme.current.supporting) {
        attributedPlaceholder = .init(text: text,
                                      color: color,
                                      font: .regular,
                                      size: 14)
    }
    
    func text(font: Font, size: CGFloat, color: UIColor) {
        self.font = font.size(size)
        self.textColor = color
    }
    
    func set(keyboardAppearance theme: Themeable) {
        self.keyboardAppearance =
        switch theme {
        case is DarkTheme: .dark
        case is LightTheme: .light
        case is CrimsonTheme: .light
        default: .light
        }
    }
    
}
