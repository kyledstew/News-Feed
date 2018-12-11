//
//  News_FeedUITests.swift
//  News-FeedUITests
//
//  Created by Kyle Stewart on 12/10/18.
//  Copyright © 2018 Kyle Stewart. All rights reserved.
//

import XCTest

class News_FeedUITests: XCTestCase {

    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.

        // In UI tests it is usually best to stop immediately when a failure occurs.
        continueAfterFailure = false

        // UI tests must launch the application that they test. Doing this in setup will make sure it happens for each test method.
        XCUIApplication().launch()

        // In UI tests it’s important to set the initial state - such as interface orientation - required for your tests before they run. The setUp method is a good place to do this.
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testThatTappingOnACellShowsThatArticle() {
        let app = XCUIApplication()
        let firstCell = app.tables.children(matching: .cell).element(boundBy: 0)
        let titleText = firstCell.staticTexts.element(matching: .any, identifier: "Article Title").label
        firstCell.tap()
        let articleDetailTitle = app.scrollViews.staticTexts.element(matching: .any, identifier: "Article Title").label
        
        XCTAssertEqual(titleText, articleDetailTitle)
    }

}
