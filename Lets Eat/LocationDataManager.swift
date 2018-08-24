//
//  LocationDataManager.swift
//  Lets Eat
//
//  Created by Francisco Javier Aranda Caro on 8/8/18.
//  Copyright © 2018 Francisco Javier Aranda Caro. All rights reserved.
//

import Foundation

class LocationDataManager{
    private var arrLocations:[String] = []
    
    func fetch(){
        for location in loadData(){
            arrLocations.append(location)
        }
    }
    
    func numberOfItems() -> Int{
        return arrLocations.count
    }
    
    func locationItem(at index: IndexPath) -> String{
        return arrLocations[index.item]
    }
    
    private func loadData() -> [String]{
        guard let path = Bundle.main.path(forResource: "Locations", ofType: "plist"),
            let items = NSArray(contentsOfFile: path) else {return []}
        return items as! [String]
    }
    
    func findLocation(by name:String)->(isFound:Bool, position:Int){
        guard let index = arrLocations.index(of: name) else{
            return(isFound:false, position:0)
        }
        return(isFound:true, position:index)
    }
}
