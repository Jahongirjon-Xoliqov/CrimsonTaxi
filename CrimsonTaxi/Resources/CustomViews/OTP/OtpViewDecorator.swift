//
//  Decorator.swift
//  OTP
//
//  Created by Omar on 8/9/20.
//  Copyright © 2020 Baianat. All rights reserved.
//

import UIKit

public struct OtpViewDecorator {
    
    var defaultBorderColor: UIColor = Theme.current.supportingBacground
    var focusedBorderColor: UIColor = Theme.current.primary
    var cornerRadius: CGFloat = 16
    var borderWidth: CGFloat = 1
    var defaultFillColor = Theme.current.supportingBacground
    var focusedFillColor = Theme.current.supportingBacground
    var isCircle: Bool = false
    var hideCursor = true
    var isSecuredTextEntry = false
    var onlyNumbers = true
    var placeHolder = ""
    var textColor: UIColor = Theme.current.text
    var font: UIFont? = Font.regular.size(20)
    
    static var defaultDecorator: OtpViewDecorator {
        get {
            return OtpViewDecorator()
        }
    }
    
}
