//
//  EventService.swift
//  KizCafePass
//
//  Created by seungwook-jung on 06/05/2019.
//  Copyright © 2019 정승욱. All rights reserved.
//

import Alamofire

class EventService {
    static func requestEvent(success: @escaping ((EventModels) -> Void), failure: ((Error?) -> Void)?) {
        let loginRequestURL = CommonDefine.API.baseDomain + CommonDefine.API.eventProgress
        Alamofire.request(loginRequestURL)
            .responseData { response in
                let decoder = JSONDecoder()
                let result: Result<EventModels> = decoder.decodeResponse(from: response)
                guard let eventModels = result.value else {
                    failure?(nil)
                    return
                }
                success(eventModels)
                    
                result.ifFailure {
                    failure?(result.error)
                }
        }
    }
}
