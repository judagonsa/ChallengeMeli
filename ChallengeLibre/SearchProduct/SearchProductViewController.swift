//
//  SearchProductViewController.swift
//  ChallengeLibre
//
//  Created by Julian González on 3/06/22.
//

import UIKit

class SearchProductViewController: UIViewController, UISearchBarDelegate, UITextViewDelegate {
    
    //MARK: IBOutlet view
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
    
    //MARK: ViewDidLoad
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureSearchView()
        
    }
    
    //MARK: ViewWillAppear
    ///show and hidding components for user interaction
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
    //MARK: Functions searchText
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
            filterRecentSearch()
            
        }
    }
    
    //MARK: Filter recentSearch
    ///Filter table recent search
    func filterRecentSearch() {
        if txtSearch.text != "" {
            recentSearchsArray = recentSearchsArray.filter { $0.contains(txtSearch.text!) }
        } else {
            print("vacio")
            recentSearchsArray = arrayFilter
        }
        
        tableViewRecentSearchs.reloadData()
    }
    
    /// get recent search from userdefaulst
    func getRecentSearch() {
        if let array = UserDefaults.standard.object(forKey: "recentSearch") as? [String] {
            
            self.recentSearchsArray = array
            self.arrayFilter = array
            filterRecentSearch()
            
        }
    }
    
    //MARK: Search Product Clicked
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        if searchBar == txtSearch {
            print("dio en buscar: \(txtSearch.text!)")
            
            searchProduct()
            
        }
    }
    
    
    /// Search product, when user clicked SEARCH for show list products
    /// - Parameter product: text product to search and send to list products view for request GET
    func searchProduct() {
        
        if !arrayFilter.contains(txtSearch.text!) {
            arrayFilter.append(txtSearch.text!)
            UserDefaults.standard.set(arrayFilter, forKey: "recentSearch")
        }
        
        if isSearchAgain {
            
            self.dismiss(animated: false)
            
        }else {
            
            let storyBoard = UIStoryboard(name: "ListProductsView", bundle: nil)
            let controller = storyBoard.instantiateViewController(withIdentifier: "ListProductsViewController") as! ListProductsViewController
            controller.txtTitleSearch = txtSearch.text!
            self.present(controller, animated: false, completion: nil)
            
        }
    }
    
    //MARK: viewWillDisappear
    ///Function dismiss search view and show list products when this show in list products or detail product view
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
    
    //MARK: Actions buttons, icons
    ///Show, hidden or dismiss view or components for interaction user
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
        showDefaultAlert(title: "Atención", message: "Acción de ver carrito en desarrollo", view: self)
    }
    
}





