//
//  SearchProductCell.swift
//  ChallengeLibre
//
//  Created by Julian González on 8/06/22.
//

import Foundation
import UIKit

extension SearchProductViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return recentSearchsArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell:UITableViewCell=UITableViewCell(style: UITableViewCell.CellStyle.default, reuseIdentifier: "cellSearchProduct")
          cell.textLabel?.text  = recentSearchsArray[indexPath.row]
         
          return cell
        
    }
    
    ///Search product selected list recent searchs
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
   
        self.searchProduct(product: recentSearchsArray[indexPath.row])
        
    }
    
}
