//
//  NavTitleView.swift
//  CrimsonTaxi
//
//  Created by Dzakhon on 22/10/23.
//

import UIKit

class NavTitleView: BaseUIView {
    
    @IBOutlet weak var selfView: UIView!
    @IBOutlet weak var backButton: NavBackButton!
    @IBOutlet weak var titleLabel: UILabel!
    
    var backTapAction: CommonAction?
    
    override func commonInit() {
        super.commonInit()
        addParent(customView: selfView)
        configure()
        clearBackground()
    }
    
    private func configure() {
        titleLabel.text = String.empty
        titleLabel.font = Font.semibold.size(17)
    }
    
    func set(title: String) {
        titleLabel.text = title
    }
    
    func enableBackButton(_ isEnabled: Bool) {
        backButton.alpha = isEnabled ? 1 : 0
        guard isEnabled else { return }
        backButton.tapAction = { [weak self] in
            guard let self else { return }
            self.backTapAction?()
        }
    }
    
}

extension NavTitleView: ThemeModifiable {
    func configureColor() {
        titleLabel.textColor = Theme.current.text
    }
}
