//
//  ExploreViewController.swift
//  Lets Eat
//
//  Created by Francisco Javier Aranda Caro on 7/8/18.
//  Copyright © 2018 Francisco Javier Aranda Caro. All rights reserved.
//

import UIKit

class ExploreViewController: UIViewController {
    
    //Variables
    @IBOutlet var collectionView:UICollectionView!
    @IBOutlet var lblLocation:UILabel!
    let manager = ExploreDataManager()
    var selectedCity:String?
    
    //View functions
    @IBAction func unwindLocationCancel(segue: UIStoryboardSegue){
        
    }
    
    @IBAction func unwindLocationDone(segue: UIStoryboardSegue){
        if let viewController = segue.source as? LocationViewController{
            selectedCity = viewController.selectedCity
        }
        if let location = selectedCity{
            lblLocation.text = location
        }
    }
    
    //Others Functions
    override func viewDidLoad() {
        super.viewDidLoad()

        manager.fetch()
        
        // Do any additional setup after loading the view.
    }
    
    func showLocationList(segue:UIStoryboardSegue){
        guard let navController = segue.destination as? UINavigationController,
            let viewController = navController.topViewController as? LocationViewController else{
                return
        }
        guard let city = selectedCity else{
            return
        }
        
        viewController.selectedCity = city
    }
    
    func showRestaurantListing(segue:UIStoryboardSegue){
        if let viewController = segue.destination as? RestaurantListViewController, let city = selectedCity,
            let index = collectionView.indexPathsForSelectedItems?.first, let type = manager.explore(at: index).name{
            viewController.selectedType = type
            viewController.selectedCity = city
        }
    }
    
    func showAlert(){
        let alertController = UIAlertController(title: "Location needed", message: "Please select a location", preferredStyle: .alert)
        let okAction = UIAlertAction(title: "Ok", style: .default, handler: nil)
        alertController.addAction(okAction)
        present(alertController, animated: true, completion: nil)
    }
    
    override func shouldPerformSegue(withIdentifier identifier: String, sender: Any?) -> Bool {
        if identifier == Segue.restaurantList.rawValue {
            guard selectedCity != nil else{
                showAlert()
                return false
            }
            return true
        }
        return true
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        switch segue.identifier {
        case Segue.locationList.rawValue:
            showLocationList(segue: segue)
        case Segue.restaurantList.rawValue:
            showRestaurantListing(segue: segue)
        default:
            print("Segue not added")
        }
    }
    
}

extension ExploreViewController: UICollectionViewDataSource{
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return manager.numberOfItems()
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "exploreCell", for: indexPath) as! ExploreCell
        
        let item = manager.explore(at: indexPath)
        
        if let name = item.name {
            cell.lblName.text = name
        }
        
        if let image = item.image{
            cell.imgExplore.image = UIImage(named: image)
        }
        
        return cell
    }
}
