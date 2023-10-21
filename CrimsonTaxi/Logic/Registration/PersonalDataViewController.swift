//
//  PersonalDataViewController.swift
//  CrimsonTaxi
//
//  Created by Dzakhon on 20/10/23.
//

import UIKit

class PersonalDataViewController: BaseViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        set(title: "Select Destination")
        setBackButton()
    }
    
    override func configureAppearance() {
        super.configureAppearance()
        func processSubviews(of view: UIView) {
            view.subviews.forEach {
                if let vw = $0 as? ThemeModifiable {
                    vw.configureColor()
                }
                processSubviews(of: $0)
            }
        }
        processSubviews(of: self.view)
        processSubviews(of: navController?.view ?? UIView())
    }
    
}
