//
//  Resa.swift
//  Lets Eat
//
//  Created by Francisco Javier Aranda Caro on 22/8/18.
//  Copyright © 2018 Francisco Javier Aranda Caro. All rights reserved.
//

import Foundation

struct RestaurantApiManager{
    static func loadJSON(file name:String) -> [[String:AnyObject]]{
        var items = [[String:AnyObject]]()
        
        guard let path = Bundle.main.path(forResource: name, ofType: "json"), let data = NSData(contentsOfFile: path) else{
            return[[:]]
        }
        
        do{
            let json = try JSONSerialization.jsonObject(with: data as Data, options: .allowFragments) as AnyObject
            if let restaurants = json["restaurants"] as? [[String:AnyObject]]{
                items = restaurants as [[String:AnyObject]]
            }
        }catch{
            print("Error serializing JSON: \(error)")
            items = [[:]]
        }
        return items
    }
}
