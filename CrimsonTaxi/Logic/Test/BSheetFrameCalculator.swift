//
//  BSheetFrameCalculator.swift
//  CrimsonTaxi
//
//  Created by Dzakhon on 04/12/23.
//

import Foundation


func getSwipeUpPoint(from currentOffset: CGPoint) -> CGPoint {
    let x: CGFloat = 0//rubberBandClamp(currentOffset.x, coeff: 0.55, dim: 100, limits: 0...100)
    let y = rubberBandClamp(currentOffset.y, coeff: 0.55, dim: 100, limits: 0...1)
    return CGPoint(x: x, y: y)
}
