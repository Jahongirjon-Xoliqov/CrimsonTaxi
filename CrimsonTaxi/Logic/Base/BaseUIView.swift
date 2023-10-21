//
//  BaseUIView.swift
//  CrimsonTaxi
//
//  Created by Dzakhon on 20/10/23.
//

import UIKit

class BaseUIView: UIView {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        commonInit()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        commonInit()
    }
    
    func commonInit() {
        Bundle.main.loadNibNamed(String(describing: type(of: self)), 
                                 owner: self,
                                 options: nil)
    }
    
    func addParent(customView: UIView) {
        customView.frame = bounds
        addSubview(customView)
    }
    
    func clearBackground() {
        backgroundColor = .clear
        layer.backgroundColor = UIColor.clear.cgColor
    }
    
}

