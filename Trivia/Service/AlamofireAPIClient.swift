//
//  AlamofireAPIClient.swift
//  Trivia
//
//  Created by Mariano Martin Battaglia on 31/05/2022.
//

import Foundation
import Alamofire

class AlamofireAPIClient {
    
    func get(url: String, completion: @escaping (Result<Data?, AFError>) -> Void) {
        AF.request(url).response { response in
            completion(response.result)
        }
    }
}
