//
//  TermModel.swift
//  Ballet Education
//
//  Created by Thuan Phung on 5/27/19.
//  Copyright © 2019 Thuan Phung. All rights reserved.
//

import Foundation

struct Term: Decodable {
    var name: String 
    var translation: String
    var definition: String
    var category: String
    var imageUrl: String
    var alternativeNames: [String]?
    
//    init(term: String, englishTranslation: String, def: String, category: String, imgURL: URL) {
//        name = term
//        translation = englishTranslation
//        definition = def
//        self.category = category
//        ImageUrl = imgURL
//    }
    
}


struct Terms: Decodable {
    var Terms: [Term]
}
