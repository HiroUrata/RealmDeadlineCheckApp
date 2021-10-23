//
//  NavigationController.swift
//  RealmDeadlineCheckApp
//
//  Created by UrataHiroki on 2021/10/23.
//

import UIKit

class NavigationController: UINavigationController {
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        
        navigationBar.tintColor = .systemRed
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(image: UIImage(systemName: "plus.rectangle.on.rectangle.fill"), style: .done, target: self, action:                                                   #selector(moveToSearchView))
        
        
        
    }
    
    @objc func moveToSearchView(){
        
        
    }


}
