//
//  BaseViewController.swift
//  CrimsonTaxi
//
//  Created by Dzakhon on 18/10/23.
//

import UIKit

class BaseViewController: UIViewController {
    lazy var navController: BaseNavigationController? = {
        navigationController as? BaseNavigationController
    }()
    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
    }
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        Theme.settings.add(self)
    }
    deinit {
        Theme.settings.remove(self)
    }
    func backTap() {}
    func configureAppearance() {
        func processSubviews(of view: UIView) {
            view.subviews.forEach {
                if let vw = $0 as? ThemeModifiable {
                    vw.configureColor()
                }
                processSubviews(of: $0)
            }
        }
        processSubviews(of: self.view)
    }
    func endEditing() {
        view.endEditing(true)
    }
}

extension BaseViewController {
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesBegan(touches, with: event)
        view.endEditing(true)
    }
}

extension BaseViewController: ThemeModifiable {
    func updateTheme() {
        configureAppearance()
    }
}
