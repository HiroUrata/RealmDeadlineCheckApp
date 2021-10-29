//
//  ViewDesigns.swift
//  RealmDeadlineCheckApp
//
//  Created by UrataHiroki on 2021/10/23.
//

import UIKit


class ViewDesigns{
    
    let haikeiImageView = UIImageView(image: UIImage(named: "haikei01"))
    
    func todayViewViewControllerDesign(todayView:UIView){
        
        haikeiImageView.frame = todayView.frame
        todayView.addSubview(haikeiImageView)
    }
    
    func searchViewControllerDesign(searchView:UIView){
        
        haikeiImageView.frame = searchView.frame
        searchView.addSubview(haikeiImageView)
    }
    
}
