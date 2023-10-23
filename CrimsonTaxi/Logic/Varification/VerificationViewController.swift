//
//  VerificationViewController.swift
//  CrimsonTaxi
//
//  Created by Dzakhon on 23/10/23.
//

import UIKit

class VerificationViewController: BaseViewController {

    @IBOutlet weak var navTitleView: NavTitleView!
    @IBOutlet weak var largeTitleLabel: UILabel!
    @IBOutlet weak var verifyButton: PrimaryButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureAppearance()
        configureNavTitleView()
        verifyButton.set(title: "Verify")
        verifyButton.tapAction = { [weak self] in
            guard let self else { return }
            Theme.settings.updateTheme(Bool.random() ? DarkTheme() : LightTheme())
        }
    }
    
    func configureNavTitleView() {
        navTitleView.enableBackButton(true)
        navTitleView.backTapAction = { [weak self] in
            guard let self else { return }
            navController?.popViewController(animated: true)
        }
    }
    
    override func configureAppearance() {
        super.configureAppearance()
        largeTitleLabel.attributedText = Attr.create(text: "Verify You Pin\nCode",
                                                     color: Theme.current.text,
                                                     font: .extrabold,
                                                     size: 32,
                                                     align: .left)
                                        .replace(text: "Code",
                                                 color: Theme.current.primary,
                                                 font: .extrabold,
                                                 size: 32,
                                                 align: .left)
        view.backgroundColor = Theme.current.background
    }
    
}
