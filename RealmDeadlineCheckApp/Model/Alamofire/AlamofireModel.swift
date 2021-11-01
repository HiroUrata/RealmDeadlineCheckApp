//
//  Alamofire.swift
//  RealmDeadlineCheckApp
//
//  Created by UrataHiroki on 2021/11/01.
//

import Alamofire
import SwiftyJSON

class AlamofireModel{
    
    var productImageURL = String()
    
}

extension AlamofireModel{
    
    public func searchProductImageURL(searchProductName:String){
        
        let requestURL = "https://app.rakuten.co.jp/services/api/IchibaItem/Search/20170706?format=json&keyword=\(searchProductName.urlEncoded)&hits=\(String(3).urlEncoded)&applicationId=1064818496677750225"
        
        AF.request(requestURL, method: .get, parameters: nil, encoding: JSONEncoding.default).responseJSON { (response) in
            
            switch response.result{
            
            case.success:
                
                self.productImageURL = ""
                let json:JSON = JSON(response.data as Any)
                
                if json["Items"][0]["Item"]["mediumImageUrls"][0]["imageUrl"].string != nil{
                    
                    self.productImageURL = json["Items"][0]["Item"]["mediumImageUrls"][0]["imageUrl"].string!
                    print(json["Items"][0]["Item"]["mediumImageUrls"][0]["imageUrl"].string!)
                    
                }else{
                    
                    print("取得出来てないよ")
                    break
                }
                
            case .failure(let error):
                print(error)
            }
        }
        
        
    }
}

extension String{
    
    var urlEncoded:String{
        
        let charset = CharacterSet.alphanumerics.union(.init(charactersIn: "/?-._~"))
        let remove = removingPercentEncoding ?? self
        
        return remove.addingPercentEncoding(withAllowedCharacters: charset) ?? remove
    }
}
