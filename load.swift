//
//  load.swift
//  trial
//
//  Created by Capgemini-DA164 on 9/25/22.
//

import Foundation

struct Root: Decodable {
    
    enum CodingKeys: String, CodingKey {
        case product = "products"
    }
    let product: [products]
}

struct products: Decodable {
    enum CodingKeys: String, CodingKey {
        case productTitle = "title"
        case productDescription = "description"
        case productThumbnail = "thumbnail"
    }
    let productTitle: String
    let productDescription: String
    let productThumbnail: String
}
