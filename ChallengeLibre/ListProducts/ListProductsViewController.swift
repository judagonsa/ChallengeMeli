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
    

    var arrayProducts: [ProductModel.Data] = []
    var txtTitleSearch = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        txtSearch.delegate = self
        txtSearch.text = txtTitleSearch
        
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
