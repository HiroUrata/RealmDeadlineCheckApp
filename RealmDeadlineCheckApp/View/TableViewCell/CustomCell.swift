//
//  CustomCell.swift
//  RealmDeadlineCheckApp
//
//  Created by UrataHiroki on 2021/10/29.
//

import UIKit

class CustomCell: UITableViewCell {

    @IBOutlet weak var cellDateLabel: UILabel!
    @IBOutlet weak var cellTextView: UITextView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
     
        print("再利用")
    }
    
}
