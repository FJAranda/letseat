//
//  MapDataManager.swift
//  Lets Eat
//
//  Created by Francisco Javier Aranda Caro on 10/8/18.
//  Copyright © 2018 Francisco Javier Aranda Caro. All rights reserved.
//

import Foundation
import MapKit

class MapDataManager:DataManager{
    fileprivate var items: [RestaurantAnnotation] = []
    
    var annotations: [RestaurantAnnotation] {
        return items
    }
    
    func fetch(completion:(_ annotations:[RestaurantAnnotation])->()){
        if items.count > 0{
            items.removeAll()
        }
        
        for data in load(file: "MapLocations") {
            items.append(RestaurantAnnotation(dict: data))
        }
        completion(items)
    }
    
    func currentRegion(latDelta: CLLocationDegrees, longDelta: CLLocationDegrees) -> MKCoordinateRegion{
        guard let item = items.first else {return MKCoordinateRegion()}
        let span = MKCoordinateSpanMake(latDelta, longDelta)
        
        return MKCoordinateRegion(center: item.coordinate, span: span)
    }

}
