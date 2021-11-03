//
//  Alamofire.swift
//  RealmDeadlineCheckApp
//
//  Created by UrataHiroki on 2021/11/01.
//

import Alamofire
import SwiftyJSON

class AlamofireModel{
    
    public var productImageURL = String()
    public var productItemCaption = String()
    
}

extension AlamofireModel{
    
    public func searchProductImageURL(searchProductName:String){
        
        let requestURL = 
        
        AF.request(requestURL, method: .get, parameters: nil, encoding: JSONEncoding.default).responseJSON { (response) in
            
            switch response.result{
            
            case.success:
                
                self.productImageURL = ""
                let json:JSON = JSON(response.data as Any)
                
                if json["Items"][0]["Item"]["mediumImageUrls"][0]["imageUrl"].string != nil &&
                   json["Items"][0]["Item"]["itemCaption"].string != nil{
                    
                    self.productImageURL = json["Items"][0]["Item"]["mediumImageUrls"][0]["imageUrl"].string!
                    self.productItemCaption = json["Items"][0]["Item"]["itemCaption"].string!
                    print(self.productImageURL)
                    print(self.productItemCaption)
                    
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
