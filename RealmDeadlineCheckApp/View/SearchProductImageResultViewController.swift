//
//  SearchProductImageResultViewController.swift
//  RealmDeadlineCheckApp
//
//  Created by UrataHiroki on 2021/11/01.
//

import UIKit
import SDWebImage

class SearchProductImageResultViewController: UIViewController {

    @IBOutlet weak var productImageView: UIImageView!
    @IBOutlet weak var productDetailTextField: UITextView!
    @IBOutlet weak var blurView: UIVisualEffectView!
    
    public var apiResultImageURL = String()
    public var apiResultItemCaption = String()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        
    }

    override func viewDidLayoutSubviews() {
     
        view.frame.origin.y = UIScreen.main.bounds.height * 0.3
        view.layer.cornerRadius = 20.0
        view.layer.maskedCorners = [.layerMinXMinYCorner,.layerMaxXMinYCorner]
        blurView.layer.cornerRadius = 20.0
        blurView.layer.maskedCorners = [.layerMinXMinYCorner,.layerMaxXMinYCorner]
        blurView.layer.masksToBounds = true
        getAPIDataPaste(imageURL: apiResultImageURL, itemCaption: apiResultItemCaption)
    }
    
}

extension SearchProductImageResultViewController{
    
    private func getAPIDataPaste(imageURL:String,itemCaption:String) {
    
        productDetailTextField.text = ""
        
        productImageView.sd_setImage(with: URL(string: imageURL), completed: nil)
        productDetailTextField.text = itemCaption
    }
}
