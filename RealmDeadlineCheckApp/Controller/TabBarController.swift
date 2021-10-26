//
//  TabBarController.swift
//  RealmDeadlineCheckApp
//
//  Created by UrataHiroki on 2021/10/23.
//

import UIKit

class TabBarController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()

        setnavigationBarItem()
        setTabItem()
        
    }
    

    @objc func moveToSearchView(){
        
        print("押された")
    }
    
    
    func setnavigationBarItem(){
        
        navigationController?.navigationBar.tintColor = .blue
        navigationItem.rightBarButtonItem = UIBarButtonItem(image: UIImage(systemName: "plus.rectangle.on.rectangle.fill"), style: .done, target: self, action: #selector(moveToSearchView))
        
    }
    
    func setTabItem(){
        
        let todayViewController = TodayViewController()
        todayViewController.tabBarItem = UITabBarItem(title: "Today", image: UIImage(systemName: "clock.fill"), tag: 0)
        
        let searchViewController = SearchViewController()
        searchViewController.tabBarItem = UITabBarItem(title: "Search", image: UIImage(systemName: "magnifyingglass"), tag: 1)
        
        viewControllers = [todayViewController,searchViewController]
        
    }

}
