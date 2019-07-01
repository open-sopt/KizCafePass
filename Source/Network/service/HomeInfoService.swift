//
//  HomeInfoService.swift
//  KizCafePass
//
//  Created by seungwook-jung on 06/05/2019.
//  Copyright © 2019 정승욱. All rights reserved.
//

import Alamofire

class HomeInfoService {
    static func requestHomeInfo(url: String, success: @escaping ((HomeInfoModels) -> Void), failure: ((Error?) -> Void)?) {
        let loginRequestURL = CommonDefine.API.baseDomain + url
        Alamofire.request(loginRequestURL)
            .responseData { response in
                let decoder = JSONDecoder()
                let result: Result<HomeInfoModels> = decoder.decodeResponse(from: response)
                guard let homeInfoModels = result.value else {
                    failure?(nil)
                    return
                }
                success(homeInfoModels)
                
                result.ifFailure {
                    failure?(result.error)
                }
        }
    }
}
