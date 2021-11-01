//
//  GetDateModel.swift
//  RealmDeadlineCheckApp
//
//  Created by UrataHiroki on 2021/11/01.
//

import Foundation

class GetDate{
    
    var todayDate = getTodayDate
    var threeDaysAgoDate = String()
}

extension GetDate{
    
    func getTodayDate() -> String{
     
        let formatter = DateFormatter()
        formatter.dateStyle = .medium
        formatter.timeStyle = .none
        formatter.locale = Locale(identifier: "ja_JP")
        let date = Date()
        return formatter.string(from: date)
        
    }
}
