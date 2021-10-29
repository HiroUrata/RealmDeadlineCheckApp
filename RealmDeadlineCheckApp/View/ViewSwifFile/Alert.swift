//
//  Alert.swift
//  RealmDeadlineCheckApp
//
//  Created by UrataHiroki on 2021/10/29.
//

import UIKit

class Alert{
    
    
}

extension Alert{
    
    public func showWarningAlert(warningContent:String,targetView:UIViewController){
        
        let warningAlert = UIAlertController(title: "Warning", message: "\(warningContent)に失敗しました", preferredStyle: .alert)
        warningAlert.addAction(UIAlertAction(title: "OK", style: .cancel, handler: nil))
        
        targetView.present(warningAlert, animated: true, completion: nil)
        
    }
}


