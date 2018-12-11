//
//  Article.swift
//  Nike Code Challenge
//
//  Created by Kyle Stewart on 12/9/18.
//  Copyright © 2018 Kyle Stewart. All rights reserved.
//

import Foundation

struct Article: Codable {
    var source: Source 
    var author: String?
    var title: String?
    var description: String?
    var url: String?
    var urlToImage: String?
    var publishedAt: String?
    var content: String?
    
    // Helper variables
    var publishedDate: Date? {
        guard let publishedAt = publishedAt else {
            return nil
        }
        
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ssZ"
        return dateFormatter.date(from: publishedAt)
    }
    
    var articleURL: URL? {
        return URL(string: url ?? "")
    }
}
