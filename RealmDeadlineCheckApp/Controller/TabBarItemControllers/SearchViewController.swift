//
//  SearchViewController.swift
//  RealmDeadlineCheckApp
//
//  Created by UrataHiroki on 2021/10/26.
//

import UIKit

class SearchViewController: UIViewController {

    @IBOutlet weak var productNameTextField: UITextField!
    @IBOutlet weak var janCodeTextField: UITextField!
    @IBOutlet weak var deadlineDayTextField: UITextField!
    @IBOutlet weak var searchButton: UIButton!

    private let realmCRUDModel = RealmCRUDModel()
    private let viewDesigns = ViewDesigns()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        viewDesigns.searchViewDesign(searchButton: searchButton)
        
    }
    
    @IBAction func search(_ sender: UIButton) {
        
        //各テキストフィールドの値によって検索をする
        if productNameTextField.text?.isEmpty != true || janCodeTextField.text?.isEmpty != true || deadlineDayTextField.text?.isEmpty != true{
            
            let searchResultVC = self.storyboard?.instantiateViewController(identifier: "searchResultVC") as! SearchResultViewController
            
            searchResultVC.navigationItem.title = "SearchResults"
            searchResultVC.keyProductName = productNameTextField.text!
            searchResultVC.keyJanCode = janCodeTextField.text!
            searchResultVC.keyDeadlineDay = deadlineDayTextField.text!
            
            self.navigationController?.pushViewController(searchResultVC, animated: true)
            
        }
        
    }
    

}



