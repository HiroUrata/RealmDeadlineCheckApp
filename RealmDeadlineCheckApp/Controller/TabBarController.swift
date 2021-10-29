//
//  TabBarController.swift
//  RealmDeadlineCheckApp
//
//  Created by UrataHiroki on 2021/10/23.
//

import UIKit

class TabBarController: UITabBarController, UIViewControllerTransitioningDelegate {

    override func viewDidLoad() {
        super.viewDidLoad()

        setnavigationBarItem()
        
        tabBar.tintColor = .black
        tabBar.unselectedItemTintColor = .tertiarySystemGroupedBackground
        tabBar.barTintColor = UIColor(red: 0, green: 76/255, blue: 152/255, alpha: 1.0)
        
    }
    
    func setnavigationBarItem(){
        
        navigationController?.navigationBar.barTintColor = UIColor(red: 0, green: 76/255, blue: 152/255, alpha: 1.0)
        
            navigationController?.navigationBar.tintColor = .white 
        navigationItem.rightBarButtonItem = UIBarButtonItem(image: UIImage(systemName: "plus.rectangle.on.rectangle.fill"), style: .done, target: self, action: #selector(moveToSearchView))
     
    }
    
    @objc func moveToSearchView(){
        
        let registerView = RegisterViewController()
        registerView.modalPresentationStyle = .custom
        registerView.transitioningDelegate = self
        present(registerView, animated: true, completion: nil)
    }
}

extension TabBarController{
    
    func presentationController(forPresented presented: UIViewController, presenting: UIViewController?, source: UIViewController) -> UIPresentationController? {
        
        PresentationController(presentedViewController: presented, presenting: presenting)
        
    }
}





