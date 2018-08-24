//
//  ExploreDataManager.swift
//  Lets Eat
//
//  Created by Francisco Javier Aranda Caro on 7/8/18.
//  Copyright © 2018 Francisco Javier Aranda Caro. All rights reserved.
//

import Foundation

class ExploreDataManager: DataManager{
    
    fileprivate var items:[ExploreItem] = []
    
    func fetch(){
        for data in load(file: "ExploreData"){
            items.append(ExploreItem(dict: data))
        }
    }
    
    func numberOfItems() -> Int{
        return items.count
    }
    
    func explore(at index:IndexPath) -> ExploreItem{
        return items[index.item]
    }
}
