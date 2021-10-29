//
//  RealmCRUDModel.swift
//  RealmDeadlineCheckApp
//
//  Created by UrataHiroki on 2021/10/26.
//

import RealmSwift

class RealmCRUDModel{
    
    private let realm = try! Realm()
    private let registerDatas = RegisterDatas()
    private let alert = Alert()
    
    lazy var readResultAllDatas:[[String:String]] = []
    
}


extension RealmCRUDModel{
    
    public func createRealmData(createProductName:String,createJanCode:String,createDeadlineDay:String,createSignUpDay:String,alertTarget:UIViewController){
        
        do{
            
            registerDatas.productName = createProductName
            registerDatas.janCode = createJanCode
            registerDatas.deadlineDay = createDeadlineDay
            registerDatas.signUpDay = createSignUpDay
            
            try realm.write({
                
                realm.add(registerDatas)
            })
            
        }catch{
            
            alert.showWarningAlert(warningContent: "データの保存", targetView: alertTarget)
        }
    }
}


extension RealmCRUDModel{
    
    public func readRealmAllData(alertTarget:UIViewController){
        
        do{
            readResultAllDatas = []
            
            try realm.write({
                
                realm.objects(RegisterDatas.self).forEach { item in
                    
                    readResultAllDatas.append(["allReadProductName":item.productName,
                                               "allReadJanCode":item.janCode,
                                               "allReadDeadlineDay":item.deadlineDay])
                }
            })
            
            
            
        }catch{
            
            alert.showWarningAlert(warningContent: "データの取得", targetView: alertTarget)
        }
    }
}
