//
//  APIHandler.swift
//  pituku-ios-tes-2
//
//  Created by Ferry Julian on 11/11/23.
//

import Foundation
import Alamofire

class APIHandler{
    static let shared = APIHandler()
    
    func fetchAPIData(handler: @escaping (_ apiData: [Data]) -> (Void)) {
        let url = "https://api.pituku.id/api/articles"
        
        AF.request(url, method: .get, parameters: nil, encoding: URLEncoding.default, headers: nil, interceptor: nil).response { responce in
            switch responce.result {
            case .success(let data):
                do {
                    print("Data size \(data?.count)")
                    let json = try JSONSerialization.jsonObject(with: data!, options: []) as? [String: Any]
                    let jsonData = try JSONDecoder().decode(Welcome.self, from: data!)
                    dump(jsonData)
                    handler(jsonData.data)
                }catch {
                    print(String(describing: error))
                    
                }
            case.failure(let error):
                print(String(describing: error))
                
            }
        }
    }
}
