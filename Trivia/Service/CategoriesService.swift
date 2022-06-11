//
//  CategoriesService.swift
//  Trivia
//
//  Created by Mariano Martin Battaglia on 31/05/2022.
//

import Foundation
import Alamofire

class CategoriesService {
    
    private struct Categories: Codable {
        let trivia_categories: [Category]
    }
    
    let apiClient = AlamofireAPIClient()
    
    func getCategories(completion: @escaping ([Category]) -> Void) {
        let categoriesURL = "https://opentdb.com/api_category.php"
        apiClient.get(url: categoriesURL) { response in
            switch response {
            case .success(let data):
                do {
                    if let data = data {
                        let categories = try JSONDecoder().decode(Categories.self, from: data)
                        completion(categories.trivia_categories)
                    }
                } catch {
                    completion([])
                }
            case .failure(_):
                completion([])
            }
        }
    }
    
//    let request = AF.request("https://opentdb.com/api_category.php")
//    request.response { [self] response in
//        switch response.result {
//        case .success(let data):
//            do {
//                if let data = data {
//                    let categories = try JSONDecoder().decode(Categories.self, from: data)
//                    print(categories.trivia_categories)
//                }
//            } catch {
//                showError(message: error.localizedDescription)
//            }
//        case .failure(let error):
//            self.showError(message: error.failure?.localizedDescription)
//        }
//    }
}

