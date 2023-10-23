//
//  PersonalDataViewController.swift
//  CrimsonTaxi
//
//  Created by Dzakhon on 20/10/23.
//

import UIKit

class PersonalDataViewController: BaseViewController {
    
    @IBOutlet weak var navTitleView: NavTitleView!
    @IBOutlet weak var largeTitleLabel: UILabel!
    @IBOutlet weak var inputFieldView: InputFieldView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureAppearance()
        configureNavTitleView()
    }
    
    func configureNavTitleView() {
        navTitleView.set(title: "Select Your Location")
        navTitleView.enableBackButton(true)
        navTitleView.backTapAction = { [weak self] in
            guard let self else { return }
            Theme.settings.updateTheme(Bool.random() ? DarkTheme() : LightTheme())
        }
    }
    
    override func configureAppearance() {
        super.configureAppearance()
        largeTitleLabel.attributedText = .init(text: "Enter Your\nPersonal Details",
                                               color: Theme.current.text,
                                               font: .extrabold,
                                               size: 32)
        view.backgroundColor = Theme.current.background
    }
    
}
