//
//  APIService.swift
//  BalletEducation
//
//  Created by Thuan Phung on 6/5/19.
//  Copyright © 2019 Thuan Phung. All rights reserved.
//

import Foundation
class APIService  {
    static var allTerm : [Term] {
        if let url = Bundle.main.url(forResource: "vocab", withExtension: "json") {
            do {
                let data = try Data(contentsOf: url)
                let decoder = JSONDecoder()
                let jsonData = try decoder.decode(Terms.self, from: data)
                return jsonData.Terms
            } catch let error {
                print("error:\(error)")
            }
        }
        return []
    }
    static let shared = APIService()
    

//    func loadAllTerms(completion: @escaping ([Term], Error?) -> ()) {
//        if let url = Bundle.main.url(forResource: "vocab", withExtension: "json") {
//            do {
//                let data = try Data(contentsOf: url)
//                let decoder = JSONDecoder()
//                let jsonData = try decoder.decode(Terms.self, from: data)
//                allTerm
//                completion(jsonData.Terms, nil)
//            } catch let error {
//                print("error:\(error)")
//                completion([], error)
//            }
//
//        }
//    }
}
