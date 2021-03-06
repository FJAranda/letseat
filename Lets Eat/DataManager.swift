//
//  DataManager.swift
//  Lets Eat
//
//  Created by Francisco Javier Aranda Caro on 10/8/18.
//  Copyright © 2018 Francisco Javier Aranda Caro. All rights reserved.
//

import Foundation

class DataManager{
    func load(file name:String) -> [[String: AnyObject]]{
        guard let path = Bundle.main.path(forResource: name, ofType: "plist"), let items = NSArray(contentsOfFile: path) else {
            return [[:]]
        }
        return items as! [[String:AnyObject]]
    }
}
