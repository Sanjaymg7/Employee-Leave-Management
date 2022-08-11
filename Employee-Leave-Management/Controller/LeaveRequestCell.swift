//
//  LeaveRequestCell.swift
//  Employee-Leave-Management
//
//  Created by Sanjay M G on 11/08/22.
//

import UIKit

class LeaveRequestCell: UITableViewCell {

    @IBOutlet weak var userName: UILabel!
    @IBOutlet weak var fromDate: UILabel!
    @IBOutlet weak var toDate: UILabel!
    @IBOutlet weak var reason: UILabel!
    @IBOutlet weak var acceptButton: UIButton!
    @IBOutlet weak var rejectButton: UIButton!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
