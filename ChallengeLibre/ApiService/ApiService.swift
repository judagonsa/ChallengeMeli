//
//  ApiService.swift
//  ChallengeLibre
//
//  Created by Julian González on 7/06/22.
//

import Foundation
import Alamofire
import SwiftyJSON

class ApiService :  NSObject {
    
    
    /// Function request type GET for search products
    /// - Parameters:
    ///   - txtProduct: Product to search
    ///   - completion: Response request decode in model
    func apiGetSearchProduct(txtProduct: String, completion : @escaping (AFDataResponse<Any>) -> ()){
        
        let url = URL(string: "https://api.mercadolibre.com/sites/MLA/search?q=\(txtProduct.replacingOccurrences(of: " ", with: "-"))")!
        
        let headers: HTTPHeaders = [
            "Content-Type": "application/json"
        ]
        
        AF.request(url, method: .get, encoding: JSONEncoding.default, headers: headers).responseJSON { response in
            //print(response)
            
            completion(response)
            
        }
    }
}
