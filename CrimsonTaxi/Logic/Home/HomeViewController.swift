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
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
            //self.searchController.move(to: self.searchController.INITIAL_POINT)
            //self.rideDetailsController.move(to: self.rideDetailsController.FINAL_POINT)
            self.driverDetailsController.move(to: self.driverDetailsController.FINAL_POINT)
        }
    }
    
}
