//
//  ListProductsCellController.swift
//  ChallengeLibre
//
//  Created by Julian González on 4/06/22.
//

import Foundation
import UIKit

extension ListProductsViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        arrayProducts.count
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cellProduct", for: indexPath as IndexPath) as! ListProductViewCell
        
        
        
        
        
        
        
        
        return cell
    }

    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        print("producto seleccionado: \(arrayProducts[indexPath.row])")
        
        let storyBoard = UIStoryboard(name: "DetailProductView", bundle: nil)
        let controller = storyBoard.instantiateViewController(withIdentifier: "DetailProductViewController") as! DetailProductViewController
        controller.detailProduct = arrayProducts[indexPath.row]
        self.present(controller, animated: true, completion: nil)
    }

}
