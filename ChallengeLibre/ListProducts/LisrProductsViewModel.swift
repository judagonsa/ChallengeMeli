//
//  LisrProductsViewModel.swift
//  ChallengeLibre
//
//  Created by Julian González on 7/06/22.
//

import Foundation

class ListProductsViewModel: NSObject {
    
    private var apiService : ApiService!
    var dataProductsSearch = [ProductModel.dataModel]()
    
    override init() {
        super.init()
        self.apiService =  ApiService()
        
    }
    
    func getSearchProductTxt(txtProduct: String, completion: @escaping ([ProductModel.dataModel]) -> ()) {
        self.apiService.apiGetSearchProduct(txtProduct: txtProduct) { dataProducts in
            
            completion(dataProducts.data!)
            //self.dataProductsSearch = dataProducts.data!
            
        }
    }
}
