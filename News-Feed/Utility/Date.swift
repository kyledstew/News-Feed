//
//  Date.swift
//  Nike Code Challenge
//
//  Created by Kyle Stewart on 12/10/18.
//  Copyright © 2018 Kyle Stewart. All rights reserved.
//

import Foundation

extension Date {
    var userFriendlyString: String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "MMM dd, yyyy"
        return dateFormatter.string(from: self)
    }
}
