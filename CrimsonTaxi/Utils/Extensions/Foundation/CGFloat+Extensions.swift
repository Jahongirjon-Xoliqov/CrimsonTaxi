//
//  CGFloat+Extensions.swift
//  CrimsonTaxi
//
//  Created by Dzakhon on 25/10/23.
//

import UIKit

extension CGFloat {
    var unsigned: CGFloat {
        guard self < 0 else {
            return self
        }
        return self*(-1)
    }
}
