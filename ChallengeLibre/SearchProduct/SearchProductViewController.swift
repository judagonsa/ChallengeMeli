//
//  SearchProductViewController.swift
//  ChallengeLibre
//
//  Created by Julian González on 3/06/22.
//

import UIKit

class SearchProductViewController: UIViewController, UISearchBarDelegate, UITextViewDelegate {

    //Components search
    @IBOutlet weak var txtSearch: UISearchBar!
    @IBOutlet weak var btnCancel: UIButton!
    @IBOutlet weak var iconShoppingCar: UIButton!
    @IBOutlet weak var stackViewAddressData: UIStackView!
    
    @IBOutlet weak var stackDataView: UIStackView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        configureGradientView()
        configureSearchView()
        
    }
    
    func configureGradientView() {
    
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
        }
    }
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        if searchBar == txtSearch {
            print("dio en buscar: \(txtSearch.text!)")
        }
    }
    
    @IBAction func btnCancelarAction(_ sender: Any) {
        txtSearch.text = ""
        iconShoppingCar.isHidden = false
        btnCancel.isHidden = true
        stackViewAddressData.isHidden = false
        txtSearch.endEditing(true)
    }
   
    @IBAction func btnIconCar(_ sender: Any) {
        let storyBoard = UIStoryboard(name: "DetailProductView", bundle: nil)
        
        let controller = storyBoard.instantiateViewController(withIdentifier: "DetailProductViewController") as! DetailProductViewController
        
        self.present(controller, animated: true, completion: nil)
    }
}





