//
//  AppShadow.swift
//  CrimsonTaxi
//
//  Created by Dzakhon on 27/10/23.
//

import UIKit

protocol AppShadow {
    var path: CGPath? { get set }
    var color: UIColor { get set }
    var offset: CGSize { get set }
    var radius: CGFloat { get set }
    var opacity: CGFloat { get set }
}

struct CommonShadow: AppShadow {
    
    var path: CGPath?
    var radius: CGFloat = 16
    var opacity: CGFloat = 0.3
    var color: UIColor = Theme.current.appBlack
    var offset: CGSize = CGSize(width: 0, height: 5)
    
    init(path: CGPath? = nil,
         radius: CGFloat,
         opacity: CGFloat,
         color: UIColor,
         offset: CGSize) {
        self.path = path
        self.radius = radius
        self.opacity = opacity
        self.color = color
        self.offset = offset
    }
    
}


