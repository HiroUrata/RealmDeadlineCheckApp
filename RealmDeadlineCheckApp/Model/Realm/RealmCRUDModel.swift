//
//  RealmCRUDModel.swift
//  RealmDeadlineCheckApp
//
//  Created by UrataHiroki on 2021/10/26.
//

import RealmSwift

class RealmCRUDModel{
    
    private let alert = Alert()
    
    lazy public var readResultAllDatas:[[String:String]] = []
    lazy public var todayReadResultDatas:[[String:String]] = []
    lazy public var searchResultDatas:[[String:String]] = []
    
}


extension RealmCRUDModel{
    
    public func createRealmData(createProductName:String?,createJanCode:String?,createDeadlineDay:String?,alertTarget:UIViewController){
        
        guard let productName = createProductName else { return }
        guard let janCode = createJanCode else { return }
        guard let deadlineDay = createDeadlineDay else { return }
        
        do{
            let realm = try Realm()
            let registerDatas = RegisterDatas()
            
            registerDatas.productName = productName
            registerDatas.janCode = janCode
            registerDatas.deadlineDay = deadlineDay
            
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
            let realm = try Realm()
            readResultAllDatas = []
            
                realm.objects(RegisterDatas.self).forEach { data in
                    
                    readResultAllDatas.append(["allReadProductName":data.productName,
                                               "allReadJanCode":data.janCode,
                                               "allReadDeadlineDay":data.deadlineDay])
                }
            
        }catch{
            
            alert.showWarningAlert(warningContent: "データの取得", targetView: alertTarget)
        }
    }
}


extension RealmCRUDModel{
    
    public func readTodayRealmData(searchKeyDate:String,alertTarget:UIViewController){
        
        do{
            let realm = try Realm()
            todayReadResultDatas = []
            
            realm.objects(RegisterDatas.self).filter(NSPredicate(format: "deadlineDay == %@", searchKeyDate)).forEach { todayData in
                
                todayReadResultDatas.append(["todayReadProductName":todayData.productName,
                                             "todayReadJanCode":todayData.janCode,
                                             "todayReadDeadlineDay":todayData.deadlineDay])
                
            }
            
            
        }catch{
            
            alert.showWarningAlert(warningContent: "データの取得", targetView: alertTarget)
        }
    }
}


extension RealmCRUDModel{
    
    public func searchRealmData(searchKeyProductName:String,searchKeyJanCode:String,searchKeyDeadlineDay:String,alertTarget:UIViewController){
        
        do{
            let realm = try Realm()
            let filterKeyProductName = NSPredicate(format: "productName == %@", searchKeyProductName)
            let filterKeyjanCode = NSPredicate(format: "janCode == %@", searchKeyJanCode)
            let filterKeydeadlineDay = NSPredicate(format: "deadlineDay == %@", searchKeyDeadlineDay)
        
            switch (searchKeyProductName.isEmpty,searchKeyJanCode.isEmpty,searchKeyDeadlineDay.isEmpty){
            
            case (false, false, false):
                realm.objects(RegisterDatas.self).filter(filterKeyProductName).filter(filterKeyjanCode).filter(filterKeydeadlineDay).forEach { searchData in
                    
                    searchResultDatas.append(["searchReadProductName":searchData.productName,
                                              "searchReadJanCode":searchData.janCode,
                                              "searchReadDeadlineDay":searchData.deadlineDay])
                    
                }
                
            case (false, false, true):
                realm.objects(RegisterDatas.self).filter(filterKeyProductName).filter(filterKeyjanCode).forEach { searchData in
                    
                    print(searchData.deadlineDay)
                    searchResultDatas.append(["searchReadProductName":searchData.productName,
                                              "searchReadJanCode":searchData.janCode,
                                              "searchReadDeadlineDay":searchData.deadlineDay])
                    print(searchResultDatas)
                }
                
            case (false, true, false):
                realm.objects(RegisterDatas.self).filter(filterKeyProductName).filter(filterKeydeadlineDay).forEach { searchData in
                    
                    searchResultDatas.append(["searchReadProductName":searchData.productName,
                                              "searchReadJanCode":searchData.janCode,
                                              "searchReadDeadlineDay":searchData.deadlineDay])
                }
                print(searchResultDatas)
                
            case (true, false, false):
                realm.objects(RegisterDatas.self).filter(filterKeyjanCode).filter(filterKeydeadlineDay).forEach { searchData in
                    
                    searchResultDatas.append(["searchReadProductName":searchData.productName,
                                              "searchReadJanCode":searchData.janCode,
                                              "searchReadDeadlineDay":searchData.deadlineDay])
                    
                }
                print(searchResultDatas)
                
            case (false, true, true):
                realm.objects(RegisterDatas.self).filter(filterKeyProductName).forEach { searchData in
                    
                    searchResultDatas.append(["searchReadProductName":searchData.productName,
                                              "searchReadJanCode":searchData.janCode,
                                              "searchReadDeadlineDay":searchData.deadlineDay])
                }
                print(searchResultDatas)
                
            case (true, false, true):
                realm.objects(RegisterDatas.self).filter(filterKeyjanCode).forEach { searchData in
                    
                    searchResultDatas.append(["searchReadProductName":searchData.productName,
                                              "searchReadJanCode":searchData.janCode,
                                              "searchReadDeadlineDay":searchData.deadlineDay])
                    
                }
                
            case (true, true, false):
                realm.objects(RegisterDatas.self).filter(filterKeydeadlineDay).forEach { searchData in
                    
                    searchResultDatas.append(["searchReadProductName":searchData.productName,
                                              "searchReadJanCode":searchData.janCode,
                                              "searchReadDeadlineDay":searchData.deadlineDay])
                    
                }
                
            case (true, true, true):
                
                alert.showWarningAlert(warningContent: "データの検索", targetView: alertTarget)
            }
            
        }catch{
            
            alert.showWarningAlert(warningContent: "データの検索", targetView: alertTarget)
        }
    }
    
}

extension RealmCRUDModel{
    
    public func deleteSelectRealmData(selectDataNumber:Int,alertTarget:UIViewController){
        
        do{
            let realm = try Realm()
            
            try realm.write({
                
                realm.delete(realm.objects(RegisterDatas.self)[selectDataNumber])
            })
            
        }catch{
            
            alert.showWarningAlert(warningContent: "データの削除", targetView: alertTarget)
        }
    }
}

extension RealmCRUDModel{
    
    public func deleteSelectDateRealmData(deleteDataDeadlineDay:String,alertTarget:UIViewController){
        
        do{
            let realm = try Realm()
            
            try realm.write({
                
                realm.delete(realm.objects(RegisterDatas.self).filter(NSPredicate(format: "deadlineDay == %@", deleteDataDeadlineDay)))
            })
        }catch{
         
            alert.showWarningAlert(warningContent: "データの削除", targetView: alertTarget)
        }
    }
}
