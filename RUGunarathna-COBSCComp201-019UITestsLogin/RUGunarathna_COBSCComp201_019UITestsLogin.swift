//
//  RUGunarathna_COBSCComp201_019UITestsLogin.swift
//  RUGunarathna-COBSCComp201-019UITestsLogin
//
//  Created by Ravindee on 2021-11-25.
//

import XCTest

class RUGunarathna_COBSCComp201_019UITestsLogin: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.

        // In UI tests it is usually best to stop immediately when a failure occurs.
        continueAfterFailure = false

        // In UI tests it’s important to set the initial state - such as interface orientation - required for your tests before they run. The setUp method is a good place to do this.
    }
    func testValidLoginSuccess(){
        
        XCUIApplication().tabBars["Tab Bar"].buttons["Settigs"].tap()
               
    }
    func testValidSigninSuccess(){
        
        let app = XCUIApplication()
        app.tabBars["Tab Bar"].buttons["Settigs"].tap()
        
        let emailAddressTextField = app.textFields["Email Address"]
        emailAddressTextField/*@START_MENU_TOKEN@*/.press(forDuration: 0.5);/*[[".tap()",".press(forDuration: 0.5);"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/
        emailAddressTextField.tap()
        
        let passwordSecureTextField = app.secureTextFields["Password"]
        passwordSecureTextField.tap()
       
        app.buttons["Sign In"].tap()
        
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

//    func testExample() throws {
//        // UI tests must launch the application that they test.
//        let app = XCUIApplication()
//        app.launch()
//
//        // Use recording to get started writing UI tests.
//        // Use XCTAssert and related functions to verify your tests produce the correct results.
//    }

    func testLaunchPerformance() throws {
        if #available(macOS 10.15, iOS 13.0, tvOS 13.0, watchOS 7.0, *) {
            // This measures how long it takes to launch your application.
            measure(metrics: [XCTApplicationLaunchMetric()]) {
                XCUIApplication().launch()
            }
        }
    }
}
