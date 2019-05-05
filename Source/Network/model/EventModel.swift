//
//  EventModel.swift
//  KizCafePass
//
//  Created by seungwook-jung on 06/05/2019.
//  Copyright © 2019 정승욱. All rights reserved.
//

import Foundation

typealias EventModels = [EventModel]

struct EventModel: Codable {
    let title: String
    let thumbnail: String
    let ongoing: Bool
    let contents, id: String
    let endDate: Int
    
    enum CodingKeys: String, CodingKey {
        case title, thumbnail, ongoing, contents
        case id = "_id"
        case endDate = "end_date"
    }
}
