//
//  GetHeadlinesResponse.swift
//  Nike Code Challenge
//
//  Created by Kyle Stewart on 12/10/18.
//  Copyright © 2018 Kyle Stewart. All rights reserved.
//

import Foundation

struct GetHeadlinesResponse: Codable {
    var status: String
    var totalResults: Int
    var articles: [Article]
}
