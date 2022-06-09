//
//  DetailProductController.swift
//  ChallengeLibre
//
//  Created by Julian González on 4/06/22.
//

import UIKit

class DetailProductViewController: UIViewController {
    
    
    // MARK: IBOutlet detail product view
    @IBOutlet weak var btnFavorite: UIButton!
    
    @IBOutlet weak var scrollViewDetail: UIScrollView!
    
    @IBOutlet weak var viewAccountSold: UIView!
    @IBOutlet weak var labelAccountSold: UILabel!
    
    @IBOutlet weak var viewNameProduct: UIView!
    @IBOutlet weak var labelNameProduct: UILabel!
    
    @IBOutlet weak var viewSoldBy: UIView!
    @IBOutlet weak var labelSoldBy: UILabel!
    
    @IBOutlet weak var viewRating: UIView!
    @IBOutlet weak var imageRating: UIImageView!
    @IBOutlet weak var labelRating: UILabel!
    
    @IBOutlet weak var viewBestSellers: UIView!
    @IBOutlet weak var labelBestSellers: UILabel!
    
    @IBOutlet weak var collectionImagesProduct: UICollectionView!
    @IBOutlet weak var labelCountImageProduct: UILabel!
    
    @IBOutlet weak var viewColorProduct: UIView!
    @IBOutlet weak var labelColor: UILabel!
    
    @IBOutlet weak var viewOriginalPrice: UIView!
    @IBOutlet weak var labelOriginalPrice: UILabel!
    
    @IBOutlet weak var viewPrice: UIView!
    @IBOutlet weak var labelPrice: UILabel!
    @IBOutlet weak var labelDiscountPrice: UILabel!
    
    @IBOutlet weak var viewNumberInstallmens: UIView!
    
    @IBOutlet weak var viewArriveFree: UIView!
    
    @IBOutlet weak var viewReturnFree: UIView!
    @IBOutlet weak var labelReturnFree: UILabel!
    
    @IBOutlet weak var viewStock: UIView!
    
    @IBOutlet weak var viewQuantityAvailable: UIView!
    @IBOutlet weak var labelQuantity: UILabel!
    @IBOutlet weak var labelAvailable: UILabel!
    
    @IBOutlet weak var viewQuantitiesBuy: UIView!
    @IBOutlet weak var labelQuantitiesBuy: UILabel!
    
    @IBOutlet weak var viewBuyNowAddCar: UIView!
    
    @IBOutlet weak var viewProtectedPurchase: UIView!
    @IBOutlet weak var labelPoinstBuy: UILabel!
    
    @IBOutlet weak var viewFavoriteShare: UIView!
    @IBOutlet weak var btnAddFavorite: UIButton!
    
    @IBOutlet weak var viewDescription: UIView!
    @IBOutlet weak var labelDescription: UILabel!
    
    @IBOutlet weak var viewReturn: UIView!
    @IBOutlet weak var labelDaysReturn: UILabel!
    @IBOutlet weak var btnLearMoreReturn: UIButton!
    
    var detailProduct: ProductModel.dataModel!
    var arrayImagesProduct = [UIImage]()
    
    // MARK: ViewDidLoad
    override func viewDidLoad() {
        super.viewDidLoad()

        configureButtons()
        addImages()
    }
    
    
    /// Function add images product default
    func addImages() {
        arrayImagesProduct.removeAll()
        arrayImagesProduct.append(UIImage(named: "yellow")!)
        arrayImagesProduct.append(UIImage(named: "blue")!)
        arrayImagesProduct.append(UIImage(named: "red")!)
        collectionImagesProduct.reloadData()
    }
    
    /// Configure buttons view
    func configureButtons(){
        btnLearMoreReturn.layer.borderWidth = 1
        btnLearMoreReturn.layer.borderColor = UIColor.lightGray.cgColor
    }
    
    // MARK: viewWillAppear
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        showInformation()
    }
    
    
    /// Show all available information about detail product
    func showInformation() {
        
        labelAccountSold.text = "\(detailProduct.condition! == "new" ? "Nuevo" : "Usado") | \(detailProduct.soldQuantity!) vendidos"
        labelNameProduct.text = detailProduct.titleProduct!
        
        if detailProduct.prices != nil {
            
            if detailProduct.prices!.prices!.count > 1 {
                
                viewOriginalPrice.isHidden = false
                labelDiscountPrice.isHidden = false
                
                labelOriginalPrice.text = "$ \(detailProduct.price!)"
                labelPrice.text = "$ \(detailProduct.prices!.prices![1].amount!)"
                if detailProduct.prices!.prices![1].metadata != nil {
                    labelDiscountPrice.isHidden = false
                    labelDiscountPrice.text = "\(detailProduct.prices!.prices![1].metadata!.campaignDiscountPercentage!)% OFF"
                }else{
                    labelDiscountPrice.isHidden = true
                }
                
                
            }else {
                
                viewOriginalPrice.isHidden = true
                labelDiscountPrice.isHidden = true
                
                labelPrice.text = "$ \(detailProduct.price!)"
                
            }
            
        }else {
            labelPrice.text = "$ \(detailProduct.price!)"
            viewOriginalPrice.isHidden = true
            labelDiscountPrice.isHidden = true
        }
        
        viewArriveFree.isHidden = !detailProduct.shipping!.freeShipping!
        
        labelAvailable.text = "(\(detailProduct.availableQuantity!)) disponibles"
        
        
        
    }
    
    // MARK: Function buttons, icons and interactions users
    
    @IBAction func btnBack(_ sender: Any) {
        self.dismiss(animated: true)
    }
    
    @IBAction func btnFavoriteAction(_ sender: Any) {
        showDefaultAlert(title: "Atención", message: "Acción de favorito en desarrollo", view: self)
    }
    
    
    /// Action when user search a new product, update text in UISearch and update variables for flow interaction user
    @IBAction func btnSearchAction(_ sender: Any) {
        let storyBoard = UIStoryboard(name: "SearchProductView", bundle: nil)
        let controller = storyBoard.instantiateViewController(withIdentifier: "SearchProductViewController") as! SearchProductViewController
        controller.txtTitleSearch = ""
        controller.isSearchAgain = true
        self.present(controller, animated: false, completion: nil)
    }
    
    @IBAction func btnCarShippingAction(_ sender: Any) {
        showDefaultAlert(title: "Atención", message: "Acción de ver carrito en desarrollo", view: self)
    }
    
    @IBAction func btnAddressAction(_ sender: Any) {
        showDefaultAlert(title: "Atención", message: "Acción de cambiar dirección en desarrollo", view: self)
    }
    
    @IBAction func btnRatingAction(_ sender: Any) {
        showDefaultAlert(title: "Atención", message: "Acción de calificaciones en desarrollo", view: self)
    }
    
    @IBAction func btnBestSellersAction(_ sender: Any) {
        showDefaultAlert(title: "Atención", message: "Acción de más vendidos en desarrollo", view: self)
    }
    
    @IBAction func btnColorAction(_ sender: Any) {
        showDefaultAlert(title: "Atención", message: "Acción de mostrar colores en desarrollo", view: self)
    }
    
    @IBAction func btnMoreInformationInstallmentsAction(_ sender: Any) {
        showDefaultAlert(title: "Atención", message: "Acción de número de cuotas en desarrollo", view: self)
    }
    
    @IBAction func btnOtherDeliveryAction(_ sender: Any) {
        showDefaultAlert(title: "Atención", message: "Acción de otras formas de entrega en desarrollo", view: self)
    }
    
    @IBAction func btnReturnFreeAction(_ sender: Any) {
        showDefaultAlert(title: "Atención", message: "Acción de devolución gratis en desarrollo", view: self)
    }
    
    @IBAction func btnSelectQuantityAction(_ sender: Any) {
        showDefaultAlert(title: "Atención", message: "Acción de seleccionar cantidad en desarrollo", view: self)
    }
    
    @IBAction func btnBuyNowAction(_ sender: Any) {
        showDefaultAlert(title: "Atención", message: "Acción de comprar en desarrollo", view: self)
    }
    
    @IBAction func btnAddCarAction(_ sender: Any) {
        showDefaultAlert(title: "Atención", message: "Acción de agregar al carrito en desarrollo", view: self)
    }
    
    @IBAction func btnShareAction(_ sender: Any) {
        showDefaultAlert(title: "Atención", message: "Acción de compartir en desarrollo", view: self)
    }
    
    @IBAction func btnReturnAction(_ sender: Any) {
        showDefaultAlert(title: "Atención", message: "Acción de conocer más sobre devoluciones en desarrollo", view: self)
    }
    
}
