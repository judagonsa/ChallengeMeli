//
//  ListProductsViewController.swift
//  ChallengeLibre
//
//  Created by Julian González on 3/06/22.
//

import UIKit

class ListProductsViewController: UIViewController, UISearchBarDelegate {
    
    @IBOutlet weak var txtSearch: UISearchBar!
    @IBOutlet weak var txtAddressSend: UILabel!
    
    @IBOutlet weak var viewQuantityResults: UIView!
    @IBOutlet weak var labelQuantityResults: UILabel!
    
    @IBOutlet weak var collectionListProducts: UICollectionView!
    @IBOutlet weak var loadingView: UIActivityIndicatorView!
    
    private var listProductsViewModel : ListProductsViewModel!
    var arrayProducts: [ProductModel.dataModel] = []
    var txtTitleSearch = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        listProductsViewModel = ListProductsViewModel()
        txtSearch.delegate = self
        txtSearch.text = txtTitleSearch
        
        loadingView.isHidden = false
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        viewQuantityResults.isHidden = true
        loadingView.isHidden = false
        
        listProductsViewModel.getSearchProductTxt(txtProduct: txtSearch.text!.replacingOccurrences(of: " ", with: "-")) { data in
            
            self.arrayProducts = data
            
            self.viewQuantityResults.isHidden = false
            self.labelQuantityResults.text = "\(self.arrayProducts.count) resultados"
            
            print("actualiza")
            self.collectionListProducts.reloadData()
            DispatchQueue.main.async(execute: {
                print("termina de actualizar")
                self.loadingView.isHidden = true
                self.collectionListProducts.isHidden = false
            })
        }
        
    }
    
    
    func searchBarTextDidBeginEditing(_ searchBar: UISearchBar) {
        if searchBar == txtSearch {
            let storyBoard = UIStoryboard(name: "SearchProductView", bundle: nil)
            let controller = storyBoard.instantiateViewController(withIdentifier: "SearchProductViewController") as! SearchProductViewController
            controller.txtTitleSearch = txtSearch.text!
            controller.isSearchAgain = true
            self.present(controller, animated: false, completion: nil)
        }
    }
    
    @IBAction func btnBackAction(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    
    @IBAction func btnCarShippingAction(_ sender: Any) {
        showDefaultAlert(title: "Atención", message: "Acción de ver carrito en desarrollo", view: self)
    }
    
    @IBAction func btnAddressAction(_ sender: Any) {
        showDefaultAlert(title: "Atención", message: "Acción de cambiar dirección en desarrollo", view: self)
    }
    
    @IBAction func btnFilterAction(_ sender: Any) {
        showDefaultAlert(title: "Atención", message: "Acción de filtrar en desarrollo", view: self)
    }
    
}
