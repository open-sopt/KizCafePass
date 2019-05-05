//
//  JSONDecoder+extension.swift
//  KizCafePass
//
//  Created by seungwook-jung on 05/05/2019.
//  Copyright © 2019 정승욱. All rights reserved.
//
//  https://grokswift.com/decodable-with-alamofire-4/

import Alamofire

extension JSONDecoder {
    func decodeResponse<T: Decodable>(from response: DataResponse<Data>) -> Result<T> {
        guard response.error == nil else {
            print(response.error!)
            return .failure(response.error!)
        }
        
        guard let responseData = response.data else {
            print("didn't get any data from API")
            return .failure(response.error!)
        }
        
        do {
            let item = try decode(T.self, from: responseData)
            return .success(item)
        } catch {
            print("error trying to decode response")
            print(error)
            return .failure(error)
        }
    }
}
