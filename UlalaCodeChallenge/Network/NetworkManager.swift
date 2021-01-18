//
//  NetworkManager.swift
//  UlalaCodeChallenge
//
//  Created by MiguelJasso on 17/01/21.
//  Copyright © 2021 MikeJasso. All rights reserved.
//

import UIKit

import UIKit
import Alamofire

enum ServiceResultQuery {
    case success(data: Data)
    case failed(error: String?)
}

typealias ServiceResult = (_ result : ServiceResultQuery) -> ()

enum networkQuery {
    case getMeals(by: String?)
    case getMeal(id: String)
}

class  endPoints {
    class func getURL(by: networkQuery) -> String {

        let baseURL = "https://www.themealdb.com/api/json/v1/1/"

        switch by {
        case .getMeals(let text):
            return baseURL + "search.php?s=\(text ?? "a")"
        case .getMeal (let id):
            return baseURL + "/lookup.php?i=\(id)"
        }
    }
    
}

class NetworkManager {
    static let shared = NetworkManager()
        
    private init () { }
    
    func fetchRequest(_ type: networkQuery, callback: @escaping ServiceResult) {
        
        Alamofire.request(endPoints.getURL(by: type), method: .get, parameters: nil, encoding: URLEncoding.queryString, headers: nil).response { (result) in
            if let data = result.data {
                callback(ServiceResultQuery.success(data: data))
            }else {
                callback(ServiceResultQuery.failed(error: "Error"))
            }
        }
    }
}
