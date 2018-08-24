//
//  RestaurantAnnotation.swift
//  Lets Eat
//
//  Created by Francisco Javier Aranda Caro on 10/8/18.
//  Copyright © 2018 Francisco Javier Aranda Caro. All rights reserved.
//

import UIKit
import MapKit

class RestaurantAnnotation: NSObject, MKAnnotation {
    var name: String?
    var cuisines: [String] = []
    var latitude: Double?
    var longitude: Double?
    var address: String?
    var postalCode: String?
    var state: String?
    var imageUrl: String?
    var data:[String:AnyObject]?
    
    init(dict:[String:AnyObject]){
        if let lat = dict["lat"] as? Double {self.latitude = lat}
        if let long = dict["lng"] as? Double {self.longitude = long}
        if let name = dict["name"] as? String {self.name = name}
        if let address = dict["address"] as? String {self.address = address}
        if let postalCode = dict["postal_code"] as? String {self.postalCode = postalCode}
        if let state = dict["state"] as? String {self.state = state}
        if let image = dict["image_url"] as? String {self.imageUrl = image}
        if let cuisines = dict["cuisines"] as? [AnyObject]{
            for data in cuisines{
                if let cuisine = data["cuisine"] as? String{
                    self.cuisines.append(cuisine)
                }
            }
        }
        
        data = dict
    }
    
    var coordinate: CLLocationCoordinate2D{
        guard let lat = latitude, let long = longitude else {
            return CLLocationCoordinate2D()
        }
        return CLLocationCoordinate2D(latitude: lat, longitude: long)
    }
    
    var subtitle: String?{
        if cuisines.isEmpty {
            return ""
        }else if cuisines.count == 1{
            return cuisines.first
        }else{
            return cuisines.joined(separator: ", ")
        }
    }
    
    var title: String?{
        return name
    }
    
    var restaurantItem:RestaurantItem{
        guard let restaurantData = data else{
            return RestaurantItem()
        }
        return RestaurantItem(dict: restaurantData)
    }


}
