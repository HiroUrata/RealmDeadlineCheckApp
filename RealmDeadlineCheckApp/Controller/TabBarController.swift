//
//  TabBarController.swift
//  RealmDeadlineCheckApp
//
//  Created by UrataHiroki on 2021/10/23.
//

import UIKit

class TabBarController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()

        setnavigationBarItem()
        
        tabBar.tintColor = .black
        tabBar.unselectedItemTintColor = .tertiarySystemGroupedBackground
        tabBar.barTintColor = UIColor(red: 1.0, green: 0.40, blue: 0.51, alpha: 1.0)
        
    }
    

    @objc func moveToSearchView(){
        
        print("押された")
    }
    
    
    func setnavigationBarItem(){
        
        navigationController?.navigationBar.tintColor = UIColor(red: 1.0, green: 0.40, blue: 0.51, alpha: 1.0)
        navigationItem.rightBarButtonItem = UIBarButtonItem(image: UIImage(systemName: "plus.rectangle.on.rectangle.fill"), style: .done, target: self, action: #selector(moveToSearchView))
        
    }
    
   

}




