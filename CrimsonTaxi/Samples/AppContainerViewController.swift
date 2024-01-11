//
//  AppContainerViewController.swift
//  CrimsonTaxi
//
//  Created by Dzakhon on 28/12/23.
//

import UIKit

class AppContainerViewController: UIViewController {

    @IBOutlet weak var testLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(openResultController)))
    }
    
    @objc private func openResultController() {
        
        let action = TransactionAction(title: "",
                                       icon: "",
                                       action: subaction1)
        let result = TransferResultAction(icon: "",
                                          status: "",
                                          subactions: [action])
        
        let vc = ResultStatusViewController(with: result)
        present(vc, animated: true)
        
    }
    
    private func subaction1() {
        print("worked")
    }

}
