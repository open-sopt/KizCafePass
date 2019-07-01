//
//  HomeInfoModels.swift
//  KizCafePass
//
//  Created by seungwook-jung on 06/05/2019.
//  Copyright © 2019 정승욱. All rights reserved.
//

import Foundation


typealias HomeInfoModels = [HomeInfoModel]

struct HomeInfoModel: Codable {
    let name: String
    let thumbnail: String
    let address, registerDate, id: String
    let recommand: String
    
    enum CodingKeys: String, CodingKey {
        case name, thumbnail, address
        case registerDate = "register_date"
        case id = "_id"
        case recommand
    }
}
