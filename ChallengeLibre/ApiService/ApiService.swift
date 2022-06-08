//
//  ApiService.swift
//  ChallengeLibre
//
//  Created by Julian González on 7/06/22.
//

import Foundation
import Alamofire

class ApiService :  NSObject {
    
    
    /// Function request type GET for search products
    /// - Parameters:
    ///   - txtProduct: Product to search
    ///   - completion: Response request decode in model
    func apiGetSearchProduct(txtProduct: String, completion : @escaping (ProductModel.Data) -> ()){
        
        let url = URL(string: "https://api.mercadolibre.com/sites/MLA/search?q=\(txtProduct)")!
        
        let headers: HTTPHeaders = [
            "Content-Type": "application/json"
        ]
        
        AF.request(url, method: .get, encoding: JSONEncoding.default, headers: headers).responseJSON { response in
            print(response)
            
            if let data = response.data {
                
                let jsonDecoder = JSONDecoder()
                
                let empData = try! jsonDecoder.decode(ProductModel.Data.self, from: data)
                    completion(empData)
                
            } 
            
        }
    }
}
