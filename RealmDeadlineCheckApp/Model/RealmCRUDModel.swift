//
//  RealmCRUDModel.swift
//  RealmDeadlineCheckApp
//
//  Created by UrataHiroki on 2021/10/26.
//

import RealmSwift

class RealmCRUDModel{
    
    lazy var readResultAllDatas:[[String:String]] = []
    
}


extension RealmCRUDModel{
    
    func createRealmData(createProductName:String,createJanCode:String,createDeadlineDay:String,createSignUpDay:String){
        
        do{
            let realm = try Realm()
            let registerDatas = RegisterDatas()
            
            registerDatas.productName = createProductName
            registerDatas.janCode = createJanCode
            registerDatas.deadlineDay = createDeadlineDay
            registerDatas.signUpDay = createSignUpDay
            
            try realm.write({
                
                realm.add(registerDatas)
            })
            
        }catch{
            
            
        }
    }
}
