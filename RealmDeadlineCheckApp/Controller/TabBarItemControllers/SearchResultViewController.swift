//
//  SearchResultViewController.swift
//  RealmDeadlineCheckApp
//
//  Created by UrataHiroki on 2021/10/29.
//

import UIKit

class SearchResultViewController: UIViewController {

    @IBOutlet weak var searchResultTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        searchResultTableView.delegate = self
        //searchResultTableView.dataSource = self
    }
    

}

extension SearchResultViewController:UITableViewDelegate{
    
    
}

//extension SearchResultViewController:UITableViewDataSource{
//
//    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//        <#code#>
//    }
//
//    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//        <#code#>
//    }
//
//
//
//}
