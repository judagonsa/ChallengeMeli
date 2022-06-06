//
//  SearchProductViewController.swift
//  ChallengeLibre
//
//  Created by Julian González on 3/06/22.
//

import UIKit

class SearchProductViewController: UIViewController, UISearchBarDelegate, UITextViewDelegate {
    
    //Components search view
    @IBOutlet weak var txtSearch: UISearchBar!
    @IBOutlet weak var btnCancel: UIButton!
    @IBOutlet weak var iconShoppingCar: UIButton!
    @IBOutlet weak var stackViewAddressData: UIStackView!
    
    @IBOutlet weak var viewQuantitySearch: UIView!
    @IBOutlet weak var labelQuantitySearch: UILabel!
    
    @IBOutlet weak var stackDataView: UIStackView!
    @IBOutlet weak var viewDashboard: UIView!
    @IBOutlet weak var viewRecentSearches: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureSearchView()
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        viewDashboard.isHidden = false
        viewRecentSearches.isHidden = true
        viewQuantitySearch.isHidden = true
        
        
    }
    
    func configureSearchView() {
        btnCancel.isHidden = true
        iconShoppingCar.isHidden = false
        txtSearch.delegate = self
        
    }
    
    func searchBarTextDidBeginEditing(_ searchBar: UISearchBar) {
        if searchBar == txtSearch {
            iconShoppingCar.isHidden = true
            btnCancel.isHidden = false
            stackViewAddressData.isHidden = true
            
            viewDashboard.isHidden = true
            viewRecentSearches.isHidden = false
        }
    }
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        if searchBar == txtSearch {
            print("dio en buscar: \(txtSearch.text!)")
            iconShoppingCar.isHidden = false
            btnCancel.isHidden = true
            txtSearch.endEditing(true)
            
            viewDashboard.isHidden = true
            viewRecentSearches.isHidden = true
            viewQuantitySearch.isHidden = false
            
        }
    }
    
    @IBAction func btnCancelarAction(_ sender: Any) {
        txtSearch.text = ""
        iconShoppingCar.isHidden = false
        btnCancel.isHidden = true
        stackViewAddressData.isHidden = false
        txtSearch.endEditing(true)
        
        viewDashboard.isHidden = false
        viewRecentSearches.isHidden = true
    }
    
    @IBAction func btnIconCar(_ sender: Any) {
        let storyBoard = UIStoryboard(name: "DetailProductView", bundle: nil)
        
        let controller = storyBoard.instantiateViewController(withIdentifier: "DetailProductViewController") as! DetailProductViewController
        
        self.present(controller, animated: true, completion: nil)
    }
    
    @IBAction func btnFilterAction(_ sender: Any) {
        showDefaultAlert(title: "Atención", message: "Acción de filtrar en desarrollo", view: self)
    }
}





