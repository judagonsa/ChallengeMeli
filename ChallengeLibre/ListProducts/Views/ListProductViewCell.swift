//
//  ListProductViewCell.swift
//  ChallengeLibre
//
//  Created by Julian González on 3/06/22.
//

import UIKit

class ListProductViewCell: UICollectionViewCell {
    
    @IBOutlet weak var viewBackgroundIsFavorite: UIView!
    @IBOutlet weak var imageIsFavorite: UIImageView!
    @IBOutlet weak var imageProduct: UIImageView!
    
    @IBOutlet weak var viewBestSelling: UIView!
    
    @IBOutlet weak var txtNameProduct: UILabel!
    @IBOutlet weak var txtPriceProduct: UILabel!
    
    @IBOutlet weak var txtPaymentFees: UILabel!
    
    
    @IBOutlet weak var viewFreeShipping: UIView!
    
    
    
}
