//
//  EventTableViewCell.swift
//  KizCafePass
//
//  Created by yejin on 05/05/2019.
//  Copyright © 2019 정승욱. All rights reserved.
//

import UIKit

class EventTableViewCell: UITableViewCell {
    
    @IBOutlet weak var eventTitle: UILabel!
    
    @IBOutlet weak var dday: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
