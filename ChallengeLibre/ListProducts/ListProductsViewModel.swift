//
//  LisrProductsViewModel.swift
//  ChallengeLibre
//
//  Created by Julian González on 7/06/22.
//

import Foundation

class ListProductsViewModel: NSObject {
    
    private var apiService : ApiService!
    
    override init() {
        super.init()
        self.apiService =  ApiService()
        
    }
    
    ///Request GET decode in model products and return response to controller
    /// - Parameters:
    ///   - txtProduct: product to search
    ///   - completion: response array data to controller
    func getSearchProductTxt(txtProduct: String, completion: @escaping ([ProductModel.dataModel]) -> ()) {
        self.apiService.apiGetSearchProduct(txtProduct: txtProduct) { dataProducts in
     
            let empData = try! JSONDecoder().decode(ProductModel.Data.self, from: dataProducts.data!)
                
                completion(empData.data!)
        }
    }
}
