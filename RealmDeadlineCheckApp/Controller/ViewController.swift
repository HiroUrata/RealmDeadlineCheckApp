//
//  ViewController.swift
//  RealmDeadlineCheckApp
//
//  Created by UrataHiroki on 2021/10/20.
//

import UIKit

class ViewController: UIViewController{

    let viewDesigns = ViewDesigns()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        viewDesigns.viewControllerDesign(viewController: self.view)
    }


}

