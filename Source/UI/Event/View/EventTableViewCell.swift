//
//  EventTableViewCell.swift
//  KizCafePass
//
//  Created by yejin on 05/05/2019.
//  Copyright © 2019 정승욱. All rights reserved.
//

import UIKit
import Kingfisher

class EventTableViewCell: UITableViewCell {
    
    @IBOutlet private weak var backgroundImageView: UIImageView!
    @IBOutlet private weak var eventTitle: UILabel!
    @IBOutlet private weak var dday: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    public func setEventData(_ event: EventModel) {
        let url = URL(string: event.thumbnail)
        self.backgroundImageView.kf.setImage(with: url,
                                             placeholder: UIImage(named: "eventBanner1"))
       // self.backgroundImageView.image = UIImage(named: "eventBanner1")
        
        self.eventTitle.text = event.title
        self.dday.text = "D-\(event.endDate)"
    }
    
}
