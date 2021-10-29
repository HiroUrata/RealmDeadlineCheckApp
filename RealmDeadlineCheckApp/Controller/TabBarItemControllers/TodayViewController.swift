//
//  ViewController.swift
//  RealmDeadlineCheckApp
//
//  Created by UrataHiroki on 2021/10/20.
//

import UIKit

class TodayViewController: UIViewController{


    @IBOutlet weak var cellContentsChanger: UISegmentedControl!
    @IBOutlet weak var showRealmDataTableView: UITableView!
    
    private let realmCRUDModel = RealmCRUDModel()

    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        showRealmDataTableView.register(CustomCell.self, forCellReuseIdentifier: "Cell")
        showRealmDataTableView.delegate = self
        showRealmDataTableView.dataSource = self
        
    }

//showRealmDataTableViewに表示する内容の変更
    @IBAction func changeCellContents(_ sender: UISegmentedControl) {
        
        
    }
    
}

//UITableViewDelegate
extension TodayViewController:UITableViewDelegate{
    
    
}

//UITableViewDataSource
extension TodayViewController:UITableViewDataSource{
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
//        switch cellContentsChanger.selectedSegmentIndex{
//
//        case 0:
//            return realmCRUDModel.todayReadResultDatas.count
//
//        case 1:
//            return realmCRUDModel.readResultAllDatas.count
//
//        default:
//            return 0
//        }
        return 5//完成後削除
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as! CustomCell
        

        
        return cell
    }
    
    
    
}


