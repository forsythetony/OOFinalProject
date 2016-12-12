//
//  TEST.swift
//  PAPhotoArchivingTimelineView
//
//  Created by Tony Forsythe on 12/12/16.
//  Copyright © 2016 Tony Forsythe. All rights reserved.
//

import XCTest
import Foundation

class TEST: XCTestCase {
    
    override func setUp() {
        super.setUp()
        // Put setup code here . This method is called before the invocation of each test method in the class.
        
        
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testExample() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
    }
    
    func testPerformanceExample() {
        
        let dataMan = PADataManager.sharedInstance
        
        self.measure {
            dataMan.configure()
        }
    }
    
}
