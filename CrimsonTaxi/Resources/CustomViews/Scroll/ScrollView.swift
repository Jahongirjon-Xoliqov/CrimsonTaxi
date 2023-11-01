//
//  ScrollView.swift
//  CrimsonTaxi
//
//  Created by Dzakhon on 30/10/23.
//

import UIKit

class ScrollView: UIScrollView {
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesBegan(touches, with: event)
        endEditing(true)
    }
    
}
