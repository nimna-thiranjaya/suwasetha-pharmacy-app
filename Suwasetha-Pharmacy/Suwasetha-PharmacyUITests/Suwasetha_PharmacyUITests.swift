//
//  Suwasetha_PharmacyUITests.swift
//  Suwasetha-PharmacyUITests
//
//  Created by Dhananjaya  on 2023-06-18.
//

import XCTest

final class Suwasetha_PharmacyUITests: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.

        // In UI tests it is usually best to stop immediately when a failure occurs.
        continueAfterFailure = false

        // In UI tests it’s important to set the initial state - such as interface orientation - required for your tests before they run. The setUp method is a good place to do this.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testExample() throws {
        // UI tests must launch the application that they test.
        let app = XCUIApplication()
        app.launch()
        
        app.buttons["Get Start"].tap()
        app.textFields["Search.."].tap()
        app.tabBars["Tab Bar"].buttons["Shopping Cart"].tap()
        
        app.navigationBars["Order"]/*@START_MENU_TOKEN@*/.buttons["Add Food"]/*[[".otherElements[\"Add Food\"].buttons[\"Add Food\"]",".buttons[\"Add Food\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/.tap()
        
        let collectionViewsQuery = app.collectionViews
        let patientNameTextField = collectionViewsQuery/*@START_MENU_TOKEN@*/.textFields["Patient Name"]/*[[".cells.textFields[\"Patient Name\"]",".textFields[\"Patient Name\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/
        patientNameTextField.tap()
        patientNameTextField.tap()
        
        let addressTextField = collectionViewsQuery/*@START_MENU_TOKEN@*/.textFields["Address"]/*[[".cells.textFields[\"Address\"]",".textFields[\"Address\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/
        addressTextField.tap()
        addressTextField.tap()
        collectionViewsQuery/*@START_MENU_TOKEN@*/.staticTexts["PRESCRIPTION"].swipeRight()/*[[".cells.staticTexts[\"PRESCRIPTION\"]",".swipeUp()",".swipeRight()",".staticTexts[\"PRESCRIPTION\"]"],[[[-1,3,1],[-1,0,1]],[[-1,2],[-1,1]]],[0,0]]@END_MENU_TOKEN@*/
        collectionViewsQuery/*@START_MENU_TOKEN@*/.sliders["7"].press(forDuration: 0.7);/*[[".cells.sliders[\"7\"]",".tap()",".press(forDuration: 0.7);",".sliders[\"7\"]"],[[[-1,3,1],[-1,0,1]],[[-1,2],[-1,1]]],[0,0]]@END_MENU_TOKEN@*/
        collectionViewsQuery/*@START_MENU_TOKEN@*/.buttons["Place Order"]/*[[".cells.buttons[\"Place Order\"]",".buttons[\"Place Order\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/.tap()
        
        // Use XCTAssert and related functions to verify your tests produce the correct results.
    }

    func testLaunchPerformance() throws {
        if #available(macOS 10.15, iOS 13.0, tvOS 13.0, watchOS 7.0, *) {
            // This measures how long it takes to launch your application.
            measure(metrics: [XCTApplicationLaunchMetric()]) {
                XCUIApplication().launch()
            }
        }
    }
}
