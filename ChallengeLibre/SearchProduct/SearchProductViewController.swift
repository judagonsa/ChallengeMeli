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
    
    @IBOutlet weak var stackDataView: UIStackView!
    @IBOutlet weak var viewDashboard: UIView!
    @IBOutlet weak var viewRecentSearches: UIView!
    
    var isSearchAgain = false
    var txtTitleSearch = ""
    @IBOutlet weak var tableViewRecentSearchs: UITableView!
    var recentSearchsArray = [String]()
    var arrayFilter = [String]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureSearchView()
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        if isSearchAgain {
            txtSearch.text = txtTitleSearch
            txtSearch.becomeFirstResponder()
            
            iconShoppingCar.isHidden = true
            btnCancel.isHidden = false
            stackViewAddressData.isHidden = true
            
            viewDashboard.isHidden = true
            viewRecentSearches.isHidden = false
        }else{
            
            txtSearch.text = ""
            iconShoppingCar.isHidden = false
            btnCancel.isHidden = true
            stackViewAddressData.isHidden = false
            txtSearch.endEditing(true)
            
            viewDashboard.isHidden = false
            viewRecentSearches.isHidden = true
            
        }
        
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
            
            getRecentSearch()
            
        }
    }
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        if searchBar == txtSearch {
            print(searchText)
            
            filterRecentSearch(product: searchText)
            
        }
    }
    
    func filterRecentSearch(product: String) {
        if txtSearch.text != "" {
            recentSearchsArray = recentSearchsArray.filter { $0.contains(product) }
        } else {
            print("vacio")
            recentSearchsArray = arrayFilter
        }
        
        tableViewRecentSearchs.reloadData()
    }
    
    func getRecentSearch() {
        if let array = UserDefaults.standard.object(forKey: "recentSearch") as? [String] {
            
            self.recentSearchsArray = array
            self.arrayFilter = array
            filterRecentSearch(product: txtSearch.text!)
        }
    }
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        if searchBar == txtSearch {
            print("dio en buscar: \(txtSearch.text!)")
            
            searchProduct(product: txtSearch.text!)
            
        }
    }
    
    func searchProduct(product: String) {
        
        if !recentSearchsArray.contains(product) {
            recentSearchsArray.append(product)
            UserDefaults.standard.set(recentSearchsArray, forKey: "recentSearch")
        }
        
        if isSearchAgain {
            
            self.dismiss(animated: false)
            
        }else {
            
            let storyBoard = UIStoryboard(name: "ListProductsView", bundle: nil)
            let controller = storyBoard.instantiateViewController(withIdentifier: "ListProductsViewController") as! ListProductsViewController
            controller.txtTitleSearch = product
            self.present(controller, animated: false, completion: nil)
            
        }
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        if self.isBeingDismissed {
            if isSearchAgain {
                
                self.isSearchAgain = false
                
                let storyBoard = UIStoryboard(name: "ListProductsView", bundle: nil)
                let controller = storyBoard.instantiateViewController(withIdentifier: "ListProductsViewController") as! ListProductsViewController
                controller.txtTitleSearch = self.txtSearch.text!
                self.presentingViewController?.present(controller, animated: false, completion: nil)
            }
        }
    }
    
    @IBAction func btnCancelarAction(_ sender: Any) {
        
        if isSearchAgain {
            isSearchAgain = false
            self.dismiss(animated: false)
            
        } else {
            txtSearch.text = ""
            iconShoppingCar.isHidden = false
            btnCancel.isHidden = true
            stackViewAddressData.isHidden = false
            txtSearch.endEditing(true)
            
            viewDashboard.isHidden = false
            viewRecentSearches.isHidden = true
        }
        
    }
    
    @IBAction func btnIconCar(_ sender: Any) {
        
        let storyBoard = UIStoryboard(name: "DetailProductView", bundle: nil)
        let controller = storyBoard.instantiateViewController(withIdentifier: "DetailProductViewController") as! DetailProductViewController
        
        self.present(controller, animated: false, completion: nil)
    }
    
}





