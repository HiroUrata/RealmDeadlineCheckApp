//
//  RegisterDatas.swift
//  RealmDeadlineCheckApp
//
//  Created by UrataHiroki on 2021/10/25.
//

import RealmSwift

class RegisterDatas:Object{
    
    @objc dynamic var productName = String()
    @objc dynamic var janCode = String()
    @objc dynamic var deadlineDay = String()

}
