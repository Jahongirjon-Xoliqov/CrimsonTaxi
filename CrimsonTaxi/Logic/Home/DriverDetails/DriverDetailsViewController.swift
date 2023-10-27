//
//  DriverDetailsViewController.swift
//  CrimsonTaxi
//
//  Created by Dzakhon on 26/10/23.
//

import UIKit

class DriverDetailsViewController: BaseViewController {
    
    @IBOutlet weak var dragView: UIView!
    @IBOutlet weak var driverDetailsLabel: UILabel!
    @IBOutlet weak var driverImageView: UIImageView!
    @IBOutlet weak var driverImagePlaceholderView: PlaceCircleView!
    
    @IBOutlet weak var carModelLabel: UILabel!
    @IBOutlet weak var carColorLabel: UILabel!
    @IBOutlet weak var carNumberLabel: UILabel!
    
    @IBOutlet weak var callButton: AppButton!
    @IBOutlet weak var cancelButton: AppButton!
    
    private var touchPoint: CGPoint?
    var FINAL_POINT: CGFloat = SCREEN_SIZE.height - safeAreaBottomHeight - 400
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureAppearance()
        
        dragView.clipsToBounds = true
        dragView.clip(radius: 3)
        
        
        driverImageView.image = UIImage(named: "")
        driverImagePlaceholderView.set(image: UIImage(named: "profile"))
        
        driverDetailsLabel.attributedText = Attr.create(text: "Stephen Alexander",
                                                       color: Theme.current.text,
                                                       font: .semibold,
                                                       size: 15,
                                                       align: .left)
        
        carModelLabel.attributedText = Attr.create(text: "Car: Chevralet Lacetti",
                                                       color: Theme.current.text,
                                                       font: .semibold,
                                                       size: 15,
                                                       align: .left)
        .replace(text: "Car:",
                 color: Theme.current.supporting,
                 font: .regular,
                 size: 15,
                 align: .left)
        
        carColorLabel.attributedText = Attr.create(text: "Car color: White",
                                                       color: Theme.current.text,
                                                       font: .semibold,
                                                       size: 15,
                                                       align: .left)
        .replace(text: "Car color:",
                 color: Theme.current.supporting,
                 font: .regular,
                 size: 15,
                 align: .left)
        
        carNumberLabel.attributedText = Attr.create(text: "Car number: 85 A 000 AA",
                                                       color: Theme.current.text,
                                                       font: .semibold,
                                                       size: 15,
                                                       align: .left)
        .replace(text: "Car number:",
                 color: Theme.current.supporting,
                 font: .regular,
                 size: 15,
                 align: .left)
        
        callButton.activeButton(title: "Qo'ng'iroq\nqilish",
                                image: UIImage(named: "phone"))
        cancelButton.activeButton(title: "Bekor qilish",
                                  image: UIImage(named: "cancelLarge"))
        
        cancelButton.touchEnded = { [weak self] in
            guard let self else { return }
        }
        
        callButton.touchEnded = { [weak self] in
            guard let self else { return }
        }
        
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        driverImageView.clipsToBounds = true
        driverImageView.clip(radius: driverImageView.frame.height/2)
    }
    
    override func configureAppearance() {
        super.configureAppearance()
        view.clip(radius: 16)
        view.applyShadow(opacity: 0.3)
        view.backgroundColor = Theme.current.background
        dragView.backgroundColor = Theme.current.supportingShade
    }
    
    func move(to point: CGFloat) {
        UIView.animate(withDuration: DEFAULT_ANIMATION_DURATION) {
            self.view.frame.origin.y = point
        }
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesBegan(touches, with: event)
        guard let touch = touches.first else { return }
        touchPoint = touch.location(in: view)
    }
    
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesMoved(touches, with: event)
        guard let touch = touches.first else { return }
        view.frame.origin.y = touch.location(in: view.superview).y - (touchPoint?.y ?? 0)
    }
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesEnded(touches, with: event)
        touchPoint = nil
        move(to: self.FINAL_POINT)
    }
    
    override func touchesCancelled(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesCancelled(touches, with: event)
        touchPoint = nil
    }

}
