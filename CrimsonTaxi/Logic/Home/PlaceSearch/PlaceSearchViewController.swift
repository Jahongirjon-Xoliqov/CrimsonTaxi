//
//  PlaceSearchViewController.swift
//  CrimsonTaxi
//
//  Created by Dzakhon on 24/10/23.
//

import UIKit

final class PlaceSearchViewController: BaseViewController {

    @IBOutlet weak var searchView: SearchFieldView!
    
    private var touchPoint: CGPoint?
    var FINAL_POINT: CGFloat = safeAreaBottomHeight + 50
    var INITIAL_POINT: CGFloat = SCREEN_SIZE.height - safeAreaBottomHeight - 200
    
    override func viewDidLoad() {
        super.viewDidLoad()
        searchView.set(placeholder: "Where would you go?")
        searchView.set(image: UIImage(named: "loc"))
        configureAppearance()
        
        searchView.beginSearchAction = { [weak self] in
            guard let self else { return }
            self.move(to: self.FINAL_POINT)
        }
        
        searchView.endSearchAction = { [weak self] in
            guard let self else { return }
            self.move(to: self.INITIAL_POINT)
        }
        
        searchView.didTapMapAction = { [weak self] in
            guard let self else { return }
            self.move(to: self.INITIAL_POINT)
        }
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
    }
    
    override func configureAppearance() {
        super.configureAppearance()
        view.clip(radius: 16)
        view.applyShadow(opacity: 0.3)
        view.backgroundColor = Theme.current.background
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
        let currentFrame = view.convert(view.bounds, from: view.superview)
        if currentFrame.origin.y.unsigned > SCREEN_SIZE.height/2 {
            move(to: self.INITIAL_POINT)
        } else {
            move(to: self.FINAL_POINT)
        }
    }
    
    override func touchesCancelled(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesCancelled(touches, with: event)
        touchPoint = nil
    }
    
}

