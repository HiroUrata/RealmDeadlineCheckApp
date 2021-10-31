//
//  ViewDesigns.swift
//  RealmDeadlineCheckApp
//
//  Created by UrataHiroki on 2021/10/23.
//

import UIKit


class ViewDesigns{
    
    public func searchViewDesign(searchButton:UIButton){
        
        searchButton.layer.cornerRadius = 20.0
        searchButton.layer.borderWidth = 5.0
        searchButton.layer.borderColor = UIColor.black.cgColor
        searchButton.layer.shadowOffset = CGSize(width: 5, height: 5)
        searchButton.layer.shadowOpacity = 0.65
        searchButton.layer.shadowRadius = 5
    }
    
}

extension ViewDesigns{
    
    public func cellDesign(dateLabel:UILabel,textView:UITextView){
        
        dateLabel.layer.masksToBounds = true
        dateLabel.layer.cornerRadius = 39.0
        
        textView.layer.masksToBounds = true
        textView.layer.cornerRadius = 15.0
    }
}

extension ViewDesigns{
    
    public func registerDesign(registerButton:UIButton){
        
        registerButton.layer.cornerRadius = 20.0
        registerButton.layer.shadowOffset = CGSize(width: 5, height: 5)
        registerButton.layer.shadowOpacity = 0.65
        registerButton.layer.shadowRadius = 5
        registerButton.layer.borderWidth = 3.0
        registerButton.layer.borderColor = UIColor(red: 0, green: 76/255, blue: 152/255, alpha: 1.0).cgColor
    }
}
