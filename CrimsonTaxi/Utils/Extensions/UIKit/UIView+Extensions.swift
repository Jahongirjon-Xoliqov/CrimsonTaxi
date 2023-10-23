//
//  UIView+Extensions.swift
//  CrimsonTaxi
//
//  Created by Dzakhon on 20/10/23.
//

import UIKit

extension UIView {
    
    func wrongBoder() {
        border(color: Theme.current.error)
    }
    
    func activeBorder() {
        border(color: Theme.current.primary)
    }
    
    func inactiveBorder() {
        border()
    }
    
    func border(_ width: CGFloat = 0.2,
                color: UIColor = Theme.current.supporting) {
        layer.borderColor = color.cgColor
        layer.borderWidth = width
    }
    
    func applyShadow() {
        clipsToBounds = false
        layer.masksToBounds = false
        layer.applyShadow()
    }
    
    func clip(radius: CGFloat) {
        layer.cornerRadius = radius
        layer.cornerCurve = .continuous
    }
    
    //MARK: - animations
    func fadeIn(procent: CGFloat = 0.5,
                duration: Double = DEFAULT_ANIMATION_DURATION) {
        UIView.animate(withDuration: duration) {
            self.alpha = procent
        }
    }
    
    func fadeOut(procent: CGFloat = 1,
                 duration: Double = DEFAULT_ANIMATION_DURATION) {
        UIView.animate(withDuration: duration) {
            self.alpha = procent
        }
    }
    
}

extension CALayer {
    
    func applyShadow(color: UIColor = .darkGray,
                     offset: CGSize = CGSize(width: 0, height: 5),
                     radius: CGFloat = 16,
                     opacity: Float = 0.15) {
        shadowOffset = offset
        shadowRadius = radius
        shadowOpacity = opacity
        shadowColor = color.cgColor
    }
    
}
