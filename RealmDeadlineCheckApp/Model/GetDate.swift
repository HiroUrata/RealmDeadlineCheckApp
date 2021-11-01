//
//  GetDateModel.swift
//  RealmDeadlineCheckApp
//
//  Created by UrataHiroki on 2021/11/01.
//

import Foundation

class GetDate{
    //当日の日付を取得
    func getTodayDate() -> String{
     
        let formatter = DateFormatter()
        formatter.dateStyle = .medium
        formatter.timeStyle = .none
        formatter.locale = Locale(identifier: "ja_JP")
        let date = Date()
        return formatter.string(from: date)
        
    }
    
}

extension GetDate{
    //3日前の日付を取得
    
    public func getThreeDaysAgoDate() -> String{
        
        let formatter = DateFormatter()
        formatter.dateStyle = .medium
        formatter.timeStyle = .none
        formatter.locale = Locale(identifier: "ja_JP")
        let date = Date(timeInterval: -60 * 60 * 24 * 2, since: Date())
        print(formatter.string(from: date))
        return formatter.string(from: date)
    }
    
}
