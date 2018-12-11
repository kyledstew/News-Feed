//
//  News_FeedTests.swift
//  News-FeedTests
//
//  Created by Kyle Stewart on 12/10/18.
//  Copyright © 2018 Kyle Stewart. All rights reserved.
//

import XCTest
@testable import News_Feed

class News_FeedTests: XCTestCase {

    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testHeadlinesURL() {
        let headlinesURL = Networking.headlinesURL
        XCTAssertNotNil(headlinesURL)
    }
    
    func testNetworking() {
        let data = try? Data(contentsOf: Networking.headlinesURL!)
        XCTAssertNotNil(data)
        let response = Networking.parseGetHeadlinesResponse(data: data!)
        XCTAssertNotNil(response)
    }

}
