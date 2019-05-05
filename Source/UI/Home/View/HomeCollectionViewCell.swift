//
//  HomeRecommendCollectionViewCell.swift
//  KizCafePass
//
//  Created by seungwook-jung on 05/05/2019.
//  Copyright © 2019 정승욱. All rights reserved.
//

import UIKit
import Kingfisher

class HomeCollectionViewCell: UICollectionViewCell {

    
    @IBOutlet private weak var thumbnailImageView: UIImageView?
    @IBOutlet private weak var titleLabel: UILabel?
    @IBOutlet private weak var addressLabel: UILabel?
    @IBOutlet private weak var tagLabel: UILabel?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    public func setData(_ infoModel: HomeInfoModel) {
        let url = URL(string: infoModel.thumbnail)
        self.thumbnailImageView?.kf.setImage(with: url)
        self.titleLabel?.text = infoModel.name
        self.addressLabel?.text = infoModel.address
      //  self.tagLabel?.text = "#??"
    }

}
