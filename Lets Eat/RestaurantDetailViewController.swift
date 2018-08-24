//
//  RestaurantDetailViewController.swift
//  Lets Eat
//
//  Created by Francisco Javier Aranda Caro on 14/8/18.
//  Copyright © 2018 Francisco Javier Aranda Caro. All rights reserved.
//

import UIKit
import MapKit

class RestaurantDetailViewController: UITableViewController {
    
    @IBOutlet var lblName: UILabel!
    @IBOutlet var lblCuisine: UILabel!
    @IBOutlet var lblHeaderAddress: UILabel!
    @IBOutlet var lblTableDetails: UILabel!
    @IBOutlet var lblAddress: UILabel!
    @IBOutlet var mapView: MKMapView!
    @IBOutlet var reviewsContainer: UIView!
    @IBOutlet var lblUser: UILabel!
    @IBOutlet var txtReview: UITextView!
    @IBOutlet var imgRating: UIImageView!
    @IBOutlet var btnHeart: UIBarButtonItem!
    @IBOutlet var noReviewsContainer: UIView!
    
    var selectedRestaurant: RestaurantItem?

    override func viewDidLoad() {
        super.viewDidLoad()
        initialize()
    }
    
    func initialize(){
        setupLabels()
        setupMap()
    }
    
    func setupLabels(){
        guard let restaurant = selectedRestaurant else{
            return
        }
        
        if let name = restaurant.name {lblName.text = name}
        if let cuisine = restaurant.cuisine {lblCuisine.text = cuisine}
        if let address = restaurant.address{
            lblAddress.text = address
            lblHeaderAddress.text = address
        }
        lblTableDetails.text = "Table for 7, tonight at 10:00 pm"
    }
    
    func setupMap(){
        guard let annotation = selectedRestaurant?.annotation, let long = annotation.longitude, let lat = annotation.latitude else{
            return
        }
        let location = CLLocationCoordinate2D(latitude: lat, longitude: long)
        let span = MKCoordinateSpanMake(0.5, 0.5)
        let region = MKCoordinateRegion(center: location, span: span)
        mapView.setRegion(region, animated: true)
        mapView.addAnnotations([annotation])
    }

}
