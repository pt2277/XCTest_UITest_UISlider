//
//  XCTest_UITest_UISliderUITests.swift
//  XCTest_UITest_UISliderUITests
//
//  Created by Papoj Thamjaroenporn on 10/16/17.
//  Copyright © 2017 Papoj Thamjaroenporn. All rights reserved.
//

import XCTest

class XCTest_UITest_UISliderUITests: XCTestCase {
        
    override func setUp() {
        super.setUp()
        
        // Put setup code here. This method is called before the invocation of each test method in the class.
        
        // In UI tests it is usually best to stop immediately when a failure occurs.
        continueAfterFailure = false
        // UI tests must launch the application that they test. Doing this in setup will make sure it happens for each test method.
        XCUIApplication().launch()

        // In UI tests it’s important to set the initial state - such as interface orientation - required for your tests before they run. The setUp method is a good place to do this.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    /**
     Test adjusting slider value when the slider is nested in a UITableViewCell.
     This test will fail, which is an unexpected behavior.
     The slider can be found in the XCUIElement hierarchy.
     
     Error message: Failure fetching attributes for element <XCAccessibilityElement: 0x608000274a00> pid: 23263, elementOrHash.elementID: 106102874643328.38: Error Domain=XCTDaemonErrorDomain Code=13 "Fetching value for attribute 5011 returned AX error -25205." UserInfo={NSLocalizedDescription=Fetching value for attribute 5011 returned AX error -25205.}
     Note the error domain: XCTDaemonErrorDomain
     
     The workaround below works, thanks to a StackOverflow answer.
     */
//    func testSliderAdjustsInTableView() {
//        let app = XCUIApplication()
//
//        app.staticTexts["Slider in Table View UI Test"].tap()
//
//        let cell = app.tables.element.cells["cell 0"]
//        let button = cell.buttons["Test Button"]
//        button.tap()
//
//        let slider = cell.sliders["value slider"]
//        XCTAssert(slider.exists)
//        slider.adjust(toNormalizedSliderPosition: 0.9)      // Fails here.
//
//    }
    
    
    func testSliderAdjustsInTableView() {
        let app = XCUIApplication()
        
        app.staticTexts["Slider in Table View UI Test"].tap()
        
        let cell = app.tables.element.cells["cell 0"]
        let button = cell.buttons["Test Button"]
        button.tap()
        
        let slider = cell.sliders["value slider"]
        XCTAssert(slider.exists)
        
        let fiftyPercent = slider.coordinate(withNormalizedOffset: CGVector(dx: 0.5, dy: 0.5))
        let ninetyPercent = slider.coordinate(withNormalizedOffset: CGVector(dx: 0.9, dy: 0.5))
        
        fiftyPercent.press(forDuration: 0.1, thenDragTo: ninetyPercent)
        
//        XCTAssertEqual(slider.value as! String, "90 %")
    }
    
    /**
     Test adjusting two sliders, one nested in a UITableViewCell and another not.
     
     This test will fail for nested-in-table-view-cell slider, which is an unexpected behavior.
     The slider can be found in the XCUIElement hierarchy.
     
     Error message: Failure fetching attributes for element <XCAccessibilityElement: 0x608000274a00> pid: 23263, elementOrHash.elementID: 106102874643328.38: Error Domain=XCTDaemonErrorDomain Code=13 "Fetching value for attribute 5011 returned AX error -25205." UserInfo={NSLocalizedDescription=Fetching value for attribute 5011 returned AX error -25205.}
     Note the error domain: XCTDaemonErrorDomain
     */
//    func testSliderAdjustsInEmbeddedTableView() {
//        let app = XCUIApplication()
//        
//        app.staticTexts["Slider in Embedded Table View"].tap()
//        
//        // This will work.
//        let btmSlider = app.sliders["bottom slider"]
//        XCTAssert(btmSlider.exists)
//        btmSlider.adjust(toNormalizedSliderPosition: 0.9)
//        
//        // This won't.
//        let cell = app.tables.element.cells["cell 0"]
//        let slider = cell.sliders["value slider"]
//        XCTAssert(slider.exists)
//        slider.swipeRight()
//        slider.adjust(toNormalizedSliderPosition: 0.9)     // Fails here.
//    }
    
    func testSliderAdjustsInEmbeddedTableView() {
        let app = XCUIApplication()
        
        app.staticTexts["Slider in Embedded Table View"].tap()
        
        // This will work.
        let btmSlider = app.sliders["bottom slider"]
        XCTAssert(btmSlider.exists)
        btmSlider.adjust(toNormalizedSliderPosition: 1.0)
        
        // Cell 0 slider
        let cell0 = app.tables.element.cells["cell 0"]
        let slider0 = cell0.sliders["value slider"]
        XCTAssert(slider0.exists)
        
        let v0 = (slider0.value as! NSString).floatValue / 100.0
        let currentValue0 = slider0.coordinate(withNormalizedOffset: CGVector(dx: CGFloat(v0), dy: 0.5))
        let ninetyPercent0 = slider0.coordinate(withNormalizedOffset: CGVector(dx: 1.0, dy: 0.5))
        
        currentValue0.press(forDuration: 0.1, thenDragTo: ninetyPercent0)
        
        // Cell 1 slider
        let cell1 = app.tables.element.cells["cell 1"]
        let slider1 = cell1.sliders["value slider"]
        XCTAssert(slider1.exists)
        
        let v1 = (slider1.value as! NSString).floatValue / 100.0
        let currentValue1 = slider1.coordinate(withNormalizedOffset: CGVector(dx: CGFloat(v1), dy: 0.5))
        let ninetyPercent1 = slider1.coordinate(withNormalizedOffset: CGVector(dx: 1.0, dy: 0.5))
        
        currentValue1.press(forDuration: 0.1, thenDragTo: ninetyPercent1)
    }
    
    /**
     This test will pass for sliders that are not nested inside Table View Cell.
     Even with a slider as a subview of a UIView, `adjust` works here too.
     */
    func testSliderAdjusts() {
        let app = XCUIApplication()
        
        app.staticTexts["Slider UI Test"].tap()
        
        let topSlider = app.sliders["top slider"]
        XCTAssert(topSlider.exists)
        topSlider.adjust(toNormalizedSliderPosition: 0.1)
        
        let btmSlider = app.sliders["bottom slider"]
        XCTAssert(btmSlider.exists)
        btmSlider.adjust(toNormalizedSliderPosition: 0.9)
    }
    
}
