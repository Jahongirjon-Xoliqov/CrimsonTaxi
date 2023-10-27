//
//  HomeViewController.swift
//  CrimsonTaxi
//
//  Created by Dzakhon on 24/10/23.
//

import UIKit

class HomeViewController: BaseViewController {
    
    @IBOutlet weak var mapView: MapView!
    
    var searchController = PlaceSearchViewController()
    var searchControllerView: UIView {
        searchController.view
    }
    
    var rideDetailsController = RideDetailsViewController()
    var rideDetailsControllerView: UIView {
        rideDetailsController.view
    }
    
    var driverDetailsController = DriverDetailsViewController()
    var driverDetailsControllerView: UIView {
        driverDetailsController.view
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        addChild(searchController)
        view.addSubview(searchController.view)
        searchControllerView.frame = view.bounds
        searchControllerView.frame.origin.y = view.bounds.height
        
        addChild(rideDetailsController)
        view.addSubview(rideDetailsController.view)
        rideDetailsControllerView.frame = view.bounds
        rideDetailsControllerView.frame.origin.y = view.bounds.height
        
        addChild(driverDetailsController)
        view.addSubview(driverDetailsController.view)
        driverDetailsControllerView.frame = view.bounds
        driverDetailsControllerView.frame.origin.y = view.bounds.height
        
        driverDetailsController.cancelAction = { [weak self] in
            guard let self else { return }
            self.lowerateDriverDetails()
            self.elevateRideDetails()
        }
        
        rideDetailsController.orderAction = { [weak self] in
            guard let self else { return }
            self.lowerateRideDetails()
            self.elevateDriverDetails()
        }
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        DispatchQueue.main.asyncAfter(deadline: .now()) {
            //self.searchController.move(to: self.searchController.INITIAL_POINT)
            self.rideDetailsController.move(to: self.rideDetailsController.FINAL_POINT)
            //self.driverDetailsController.move(to: self.driverDetailsController.FINAL_POINT)
        }
    }
    
    func elevateRideDetails() {
        DispatchQueue.main.asyncAfter(deadline: .now()) {
            self.rideDetailsController.move(to: self.rideDetailsController.FINAL_POINT)
        }
    }
    
    func lowerateRideDetails() {
        DispatchQueue.main.asyncAfter(deadline: .now()) {
            self.rideDetailsController.move(to: self.rideDetailsController.HIDE_POINT)
        }
    }
    
    func elevateDriverDetails() {
        DispatchQueue.main.asyncAfter(deadline: .now()) {
            self.driverDetailsController.move(to: self.driverDetailsController.FINAL_POINT)
        }
    }
    
    func lowerateDriverDetails() {
        DispatchQueue.main.asyncAfter(deadline: .now()) {
            self.driverDetailsController.move(to: self.driverDetailsController.HIDE_POINT)
        }
    }
    
}
