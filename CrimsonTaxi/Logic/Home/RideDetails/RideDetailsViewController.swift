//
//  RideDetailsViewController.swift
//  CrimsonTaxi
//
//  Created by Dzakhon on 25/10/23.
//

import UIKit

class RideDetailsViewController: BaseViewController {

    @IBOutlet weak var dragView: UIView!
    @IBOutlet weak var separatorView: UIView!
    @IBOutlet weak var distanceLabel: UILabel!
    @IBOutlet weak var distanceHintLabel: UILabel!
    @IBOutlet weak var sourcePlaceView: PlaceDetailsView!
    @IBOutlet weak var destinationPlaceView: PlaceDetailsView!
    @IBOutlet weak var orderButton: PrimaryButton!
    @IBOutlet weak var dashView: UIView!
    @IBOutlet weak var sourceEditButton: IconButton!
    @IBOutlet weak var destinationEditButton: IconButton!
    
    
    private var touchPoint: CGPoint?
    var FINAL_POINT: CGFloat = SCREEN_SIZE.height - safeAreaBottomHeight - 500
    var HIDE_POINT: CGFloat = SCREEN_SIZE.height
    
    var orderAction: CommonAction?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureAppearance()
        
        dragView.clipsToBounds = true
        dragView.clip(radius: 3)
        
        distanceHintLabel.attributedText = Attr.create(text: "Distance", 
                                                       color: Theme.current.text,
                                                       font: .semibold,
                                                       size: 15,
                                                       align: .left)
        
        distanceLabel.attributedText = Attr.create(text: "4.4 Km",
                                                   color: Theme.current.primary,
                                                   font: .semibold,
                                                   size: 17,
                                                   align: .right)
        
        sourcePlaceView.set(image: UIImage(named: "targetLarge"))
        sourcePlaceView.set(place: "Current Location", details: "45 Tyler Streets, VA\n17333")
        
        destinationPlaceView.set(image: UIImage(named: "locFill"))
        destinationPlaceView.set(place: "Starbucks", details: "453 William Trail Apt. 896\nLesterstad")
        
        orderButton.set(title: "6 000 som ga taksi chaqirish")
        orderButton.tapAction = { [weak self] in
            guard let self else { return }
            self.orderAction?()
        }
        
        sourceEditButton.set(image: UIImage(named: "edit"))
        destinationEditButton.set(image: UIImage(named: "edit"))
        
        sourceEditButton.tapAction = { [weak self] in
            guard let self else { return }
            print("source location change tapped")
        }
        
        destinationEditButton.tapAction = { [weak self] in
            guard let self else { return }
            print("destination location change tapped")
        }
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        drawRoad()
    }
    
    override func configureAppearance() {
        super.configureAppearance()
        view.clip(radius: 16)
        view.applyShadow(opacity: 0.3)
        view.backgroundColor = Theme.current.background
        dragView.backgroundColor = Theme.current.supportingShade
        separatorView.backgroundColor = Theme.current.separator
        sourceEditButton.iconTintColor = Theme.current.primary
        destinationEditButton.iconTintColor = Theme.current.primary
    }
    
    func drawRoad() {
        
        dashView.layer.sublayers?.forEach { $0.removeFromSuperlayer() }
        
        let path = UIBezierPath()
        path.move(to: CGPoint(x: dashView.bounds.midX, y: 0))
        path.addLine(to: CGPoint(x: dashView.bounds.midX, y: dashView.bounds.height))
        path.close()
        
        let shapeLayer = CAShapeLayer()
        shapeLayer.strokeColor = Theme.current.primary.cgColor
        shapeLayer.lineCap = .round
        shapeLayer.lineWidth = 1
        shapeLayer.lineDashPattern = [2, 6]
        shapeLayer.path = path.cgPath
        
        dashView.layer.addSublayer(shapeLayer)
        dashView.layer.mask = shapeLayer
        dashView.backgroundColor = Theme.current.primary
        
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
