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

extension Alert{
    
    public func showDeleteRealmDataAlert(targetView:UIViewController){
        
        let realmCRUDModel = RealmCRUDModel()
        var deadlineDayTextField:UITextField?
        
        let textfieldAlert = UIAlertController(title: "DeleteAlert", message: "削除したいデータの日付を入力してください。", preferredStyle: .alert)
        
        textfieldAlert.addTextField { (alertTextField:UITextField) in
            
            alertTextField.placeholder = "例:2021/01/01"
            deadlineDayTextField = alertTextField
            deadlineDayTextField?.keyboardType = .numbersAndPunctuation
        }
        
        textfieldAlert.addAction(UIAlertAction(title: "削除", style: .destructive, handler: { _ in
            
            realmCRUDModel.deleteSelectDateRealmData(deleteDataDeadlineDay: (deadlineDayTextField?.text)!, alertTarget: targetView)
            
        }))
        textfieldAlert.addAction(UIAlertAction(title: "キャンセル", style: .cancel, handler: nil))
        
        targetView.present(textfieldAlert, animated: true, completion: nil)
    }
    
}


