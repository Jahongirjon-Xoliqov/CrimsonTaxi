//
//  Contants.swift
//  CrimsonTaxi
//
//  Created by Dzakhon on 20/10/23.
//

import UIKit

typealias CommonAction = ()->()

let DEFAULT_ANIMATION_DURATION: Double = 0.5

var SCREEN_SIZE: CGSize {
    guard let window = UIApplication.shared.windows.first else { return .zero }
    return window.bounds.size
}

var safeAreaBottomHeight: CGFloat {
    let window = UIApplication.shared.windows.first
    let bottomPadding = window?.safeAreaInsets.bottom ?? 0
    return bottomPadding
}

var window: UIWindow? {
    UIApplication.shared.windows.first
}

let primaryShadow: AppShadow = CommonShadow(radius: 10,
                                            opacity: 0.3,
                                            color: Theme.current.primary,
                                            offset: CGSize(width: 0, height: 10))

