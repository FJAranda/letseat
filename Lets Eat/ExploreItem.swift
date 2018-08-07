//
//  ExploreItem.swift
//  Lets Eat
//
//  Created by Francisco Javier Aranda Caro on 7/8/18.
//  Copyright © 2018 Francisco Javier Aranda Caro. All rights reserved.
//

import Foundation

struct ExploreItem{
    var name:String?
    var image:String?
}

extension ExploreItem{
    init(dict:[String:AnyObject]){
        self.name = dict["name"] as? String
        self.image = dict["image"] as? String
        
    }
}
