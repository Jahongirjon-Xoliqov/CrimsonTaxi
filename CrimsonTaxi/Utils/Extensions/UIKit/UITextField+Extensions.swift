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
    
}
