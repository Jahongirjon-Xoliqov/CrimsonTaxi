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
    func configureAppearance() {}
}

extension BaseViewController {
    func set(title: String) {
        navController?.set(title: title)
    }
    func setBackButton() {
        navController?.setBackButton { [weak self] in
            guard let self else { return }
            self.backTap()
        }
    }
}

extension BaseViewController: ThemeModifiable {
    func updateTheme() {
        configureAppearance()
    }
}
