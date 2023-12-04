//
//  TestViewController.swift
//  CrimsonTaxi
//
//  Created by Dzakhon on 20/10/23.
//

import UIKit

final class TestViewController: BaseViewController {

    @IBOutlet weak var boundsView: UIView!
    @IBOutlet weak var circleView: UIView!
    
    
    private var contentOffsetBounds: CGRect {
        CGRect(x: 0, y: view.bounds.minY, width: 0.01, height: 0.01)
    }
    
    private var contentOffset: CGPoint = .zero {
        didSet {
            circleView.frame.origin = CGPoint(x: -contentOffset.x,
                                              y: view.bounds.minY - contentOffset.y)
        }
    }
    
    private enum State {
        case `default`
        case dragging(initialOffset: CGPoint)
    }

    private var state: State = .default
    
    private var contentOffsetAnimation: TimerAnimation?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        //setupScrollView()
        configureCircleView()
        addGesture()
    }
    
    private func configureCircleView() {
        circleView.backgroundColor = .orange
        boundsView.border(1, color: UIColor.red)
    }
    
    
    private func addGesture() {
        let panGesture = UIPanGestureRecognizer(target: self, action: #selector(handleGesture))
        view.addGestureRecognizer(panGesture)
    }
    
    @objc private func handleGesture(_ sender: UIPanGestureRecognizer) {
        
        switch sender.state {
        case .began:
            stopOffsetAnimation()
            state = .dragging(initialOffset: contentOffset)
        case .changed:
            let translation = sender.translation(in: view)
            if case .dragging(let initialOffset) = state {
                contentOffset = clampOffset(initialOffset - translation)
            }
        case .ended:
            state = .default
            let velocity: CGPoint = sender.velocity(in: view)
            completeGesture(withVelocity: -velocity)
            
        default: break
        }
        
    }
    
    private func stopOffsetAnimation() {
        contentOffsetAnimation?.invalidate()
        contentOffsetAnimation = nil
    }
    
    private func clampOffset(_ offset: CGPoint) -> CGPoint {
        let rubberBand = RubberBand(dims: view.frame.size, bounds: contentOffsetBounds)
        return rubberBand.clamp(offset)
    }
    
    private func completeGesture(withVelocity velocity: CGPoint) {
        if contentOffsetBounds.containsIncludingBorders(contentOffset) {
            startDeceleration(withVelocity: velocity)
        } else {
            bounce(withVelocity: velocity)
        }
    }
    
    private func startDeceleration(withVelocity velocity: CGPoint) {
        let d = UIScrollView.DecelerationRate.normal.rawValue
        let parameters = DecelerationTimingParameters(initialValue: contentOffset, initialVelocity: velocity,
                                                      decelerationRate: d, threshold: 0.5)
                                                      
        let destination = parameters.destination
        let intersection = getIntersection(rect: contentOffsetBounds, segment: (contentOffset, destination))
        
        let duration: TimeInterval
        
        if let intersection = intersection, let intersectionDuration = parameters.duration(to: intersection) {
            duration = intersectionDuration
        } else {
            duration = parameters.duration
        }
        
        contentOffsetAnimation = TimerAnimation(
            duration: duration,
            animations: { [weak self] _, time in
                self?.contentOffset = parameters.value(at: time)
            },
            completion: { [weak self] finished in
                guard finished && intersection != nil else { return }
                let velocity = parameters.velocity(at: duration)
                self?.bounce(withVelocity: velocity)
            })
    }
    
    private func bounce(withVelocity velocity: CGPoint) {
        let restOffset = contentOffset.clamped(to: contentOffsetBounds)
        let displacement = contentOffset - restOffset
        let threshold = 0.5 / UIScreen.main.scale
        let spring = Spring(mass: 1, stiffness: 100, dampingRatio: 1)
        
        let parameters = SpringTimingParameters(spring: spring,
                                                displacement: displacement,
                                                initialVelocity: velocity,
                                                threshold: threshold)
       
        contentOffsetAnimation = TimerAnimation(
            duration: parameters.duration,
            animations: { [weak self] _, time in
                self?.contentOffset = restOffset + parameters.value(at: time)
            })
    }
    
}
