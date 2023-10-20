//
//  TestViewController.swift
//  CrimsonTaxi
//
//  Created by Dzakhon on 20/10/23.
//

import UIKit

class TestViewController: BaseViewController {

    @IBOutlet weak var testLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        testLabel.text = "Cool"
        testLabel.font = Font.light.size(48)
    }
    
    override func configureAppearance() {
        super.configureAppearance()
        func processSubviews(of view: UIView) {
            for subview in view.subviews {
                processSubviews(of: subview)
            }
        }
        processSubviews(of: view)
    }

}
