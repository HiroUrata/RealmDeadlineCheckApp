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
    private let viewDesigns = ViewDesigns()
    private let getDate = GetDate()
    private let alert = Alert()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        showRealmDataTableView.register(UINib(nibName: "CustomCell", bundle: nil), forCellReuseIdentifier: "Cell")
        showRealmDataTableView.delegate = self
        showRealmDataTableView.dataSource = self
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        realmCRUDModel.readTodayRealmData(searchKeyDate: getDate.getTodayDate(), alertTarget: self)
    }

//showRealmDataTableViewに表示する内容の変更
    @IBAction func changeCellContents(_ sender: UISegmentedControl) {
        
        switch sender.selectedSegmentIndex{
        
        case 0: //当日分のデータを取得
            realmCRUDModel.readTodayRealmData(searchKeyDate: getDate.getTodayDate(), alertTarget: self)
            showRealmDataTableView.reloadData()
            
        case 1: //全てのデータを取得
            realmCRUDModel.readRealmAllData(alertTarget: self)
            showRealmDataTableView.reloadData()
            
        default:
            
            break
        }
    }
    
}

//UITableViewDelegate
extension TodayViewController:UITableViewDelegate{
    
    func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        
        let deleteAction = UIContextualAction(style: .destructive, title: "") {(_,_, _) in
            
            switch self.cellContentsChanger.selectedSegmentIndex{
            
            case 0:
                self.realmCRUDModel.deleteSelectRealmData(selectProductName: self.realmCRUDModel.todayReadResultDatas[indexPath.row]["todayReadProductName"]!,
                                                          selectJanCode: self.realmCRUDModel.todayReadResultDatas[indexPath.row]["todayReadJanCode"]!,
                                                          selectDeadlineDay: self.realmCRUDModel.todayReadResultDatas[indexPath.row]["todayReadDeadlineDay"]!,
                                                          alertTarget: self)
                self.realmCRUDModel.todayReadResultDatas.remove(at: indexPath.row)
                tableView.deleteRows(at: [indexPath], with: .automatic)
                self.realmCRUDModel.readTodayRealmData(searchKeyDate: self.getDate.getTodayDate(), alertTarget: self)
                tableView.reloadData()
   
                
            case 1:
                self.realmCRUDModel.deleteSelectRealmData(selectProductName: self.realmCRUDModel.readResultAllDatas[indexPath.row]["allReadProductName"]!,
                                                          selectJanCode: self.realmCRUDModel.readResultAllDatas[indexPath.row]["allReadJanCode"]!,
                                                          selectDeadlineDay: self.realmCRUDModel.readResultAllDatas[indexPath.row]["allReadDeadlineDay"]!,
                                                          alertTarget: self)
                self.realmCRUDModel.readResultAllDatas.remove(at: indexPath.row)
                tableView.deleteRows(at: [indexPath], with: .automatic)
                self.realmCRUDModel.readRealmAllData(alertTarget: self)
                tableView.reloadData()
                
            default:
                self.alert.showWarningAlert(warningContent: "データの削除", targetView: self)
            }
        }
        deleteAction.image = UIImage(systemName: "trash.fill")
        deleteAction.backgroundColor = .systemRed
        
        return UISwipeActionsConfiguration(actions: [deleteAction])
    }
    
}

//UITableViewDataSource
extension TodayViewController:UITableViewDataSource{
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        switch cellContentsChanger.selectedSegmentIndex{

        case 0:
            return realmCRUDModel.todayReadResultDatas.count

        case 1:
            return realmCRUDModel.readResultAllDatas.count

        default:
            return 0
        }
        //return 50//完成後削除
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as! CustomCell
        
        switch cellContentsChanger.selectedSegmentIndex{
        
        case 0:
            if realmCRUDModel.todayReadResultDatas.count > 0{
                
            cell.cellDateLabel.text = realmCRUDModel.todayReadResultDatas[indexPath.row]["todayReadDeadlineDay"] ?? "ERROR"
            cell.cellTextView.text = """
                                     商品名: \(realmCRUDModel.todayReadResultDatas[indexPath.row]["todayReadProductName"] ?? "ERROR")
                                     
                                     Jan: \(realmCRUDModel.todayReadResultDatas[indexPath.row]["todayReadJanCode"] ?? "ERROR")
                                     """
            }else{
                cell.cellDateLabel.text = "ERROR"
                cell.cellTextView.text = "ERROR"
            }
            
        case 1:
            if realmCRUDModel.readResultAllDatas.count > 0{
                
            cell.cellDateLabel.text = realmCRUDModel.readResultAllDatas[indexPath.row]["allReadDeadlineDay"] ?? "ERROR"
            cell.cellTextView.text = """
                商品名: \(realmCRUDModel.readResultAllDatas[indexPath.row]["allReadProductName"] ?? "ERROR")
                
                Jan: \(realmCRUDModel.readResultAllDatas[indexPath.row]["allReadJanCode"] ?? "ERROR")
                """
            }else{
                cell.cellDateLabel.text = "ERROR"
                cell.cellTextView.text = "ERROR"
            }
            
         default:
             cell.cellDateLabel.text = "ERROR"
             cell.cellTextView.text = "ERROR"
        }
        
        viewDesigns.cellDesign(dateLabel: cell.cellDateLabel, textView: cell.cellTextView)
        
        return cell
    }
    
    
    
}


