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
    @IBOutlet weak var otpView: OtpView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureAppearance()
        configureNavTitleView()
        verifyButton.set(title: "Verify")
        verifyButton.tapAction = { [weak self] in
            guard let self else { return }
            let vc = MainTabBarController()
            let root = BaseNavigationController(rootViewController: vc)
            root.modalPresentationStyle = .fullScreen
            self.navController?.present(root, animated: true)
        }
        otpView.decorator = OtpViewDecorator.defaultDecorator
        otpView.delegate = self
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
        view.backgroundColor = Theme.current.background
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
    }
    
}

extension VerificationViewController: OtpViewDelegate {
    func shouldReceive(otpCode code: String, at otpView: OtpView) -> Bool {
        print(code)
        return true
    }
}
