//
//  ViewDesigns.swift
//  RealmDeadlineCheckApp
//
//  Created by UrataHiroki on 2021/10/23.
//

import UIKit


class ViewDesigns{
    
    func viewControllerDesign(viewController:UIView){
        
        let haikeiImageView = UIImageView(frame: viewController.frame)
        haikeiImageView.image = UIImage(named: "haikei01")
        viewController.addSubview(haikeiImageView)
    }
}
