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
        return arrayProducts.count / 3
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "ListProductCell", for: indexPath as IndexPath) as! ListProductViewCell
        
        let index = indexPath.row
        
        let url = URL(string: arrayProducts[index].imageListProduct!)
        let data = try? Data(contentsOf: url!)
        cell.imageProduct.image = UIImage(data: data!)!
        
        cell.txtNameProduct.text = arrayProducts[index].titleProduct!
        cell.txtPriceProduct.text = "$ \(arrayProducts[index].price!)"
        cell.txtPaymentFees.text = "en \(arrayProducts[index].installments!.quantity!)x $ \(arrayProducts[index].installments!.amount!)"
        cell.viewFreeShipping.isHidden = !arrayProducts[index].shipping!.freeShipping!
        
        return cell
    }

    
    /// Show detail product view selected in collection or list products
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        print("producto seleccionado: \(arrayProducts[indexPath.row])")
        
        let storyBoard = UIStoryboard(name: "DetailProductView", bundle: nil)
        let controller = storyBoard.instantiateViewController(withIdentifier: "DetailProductViewController") as! DetailProductViewController
        controller.detailProduct = arrayProducts[indexPath.row]
        self.present(controller, animated: true, completion: nil)
    }

}
