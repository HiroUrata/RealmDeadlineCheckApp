//
//  SearchResultViewController.swift
//  RealmDeadlineCheckApp
//
//  Created by UrataHiroki on 2021/10/29.
//

import UIKit

class SearchResultViewController: UIViewController {

    @IBOutlet weak var searchResultTableView: UITableView!
    
    public var keyProductName = String()
    public var keyJanCode =  String()
    public var keyDeadlineDay = String()
    
    private let realmCRUDModel = RealmCRUDModel()
    private let viewDesigns = ViewDesigns()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        searchResultTableView.register(UINib(nibName: "CustomCell", bundle: nil), forCellReuseIdentifier: "Cell")
        searchResultTableView.delegate = self
        searchResultTableView.dataSource = self
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        realmCRUDModel.searchRealmData(searchKeyProductName: keyProductName, searchKeyJanCode: keyJanCode, searchKeyDeadlineDay: keyDeadlineDay, alertTarget: self)
    }

}

extension SearchResultViewController:UITableViewDelegate{
    
    
}

extension SearchResultViewController:UITableViewDataSource{

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return realmCRUDModel.searchResultDatas.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as! CustomCell
        
        cell.cellDateLabel.text = realmCRUDModel.searchResultDatas[indexPath.row]["searchReadDeadlineDay"]
        cell.cellTextView.text = """
                                 商品名: \(realmCRUDModel.searchResultDatas[indexPath.row]["searchReadProductName"] ?? "ERROR")
                                 Jan: \(realmCRUDModel.searchResultDatas[indexPath.row]["searchReadJanCode"] ?? "ERROR")
                                 """
        
        viewDesigns.cellDesign(dateLabel: cell.cellDateLabel, textView: cell.cellTextView)
        
        return cell
    }



}
