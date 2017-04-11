//
//  SieveOfTheEratosthenesVarietyTests.swift
//  SieveOfTheEratosthenesVarietyTests
//
//  Created by Michelline Tran on 4/4/17.
//  Copyright © 2017 MichellineTran. All rights reserved.
//

import XCTest
@testable import SieveOfTheEratosthenesVariety

class SieveOfTheEratosthenesVarietyTests: XCTestCase {
    
    override func setUp() {
        super.setUp()
    // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }

    func testSimple() {
        let primeNumberGenerator = PrimeNumberGenerator()
        XCTAssertEqual(primeNumberGenerator.findPrimesThrough(value: 30), examplePrimes)
    }
    

    let examplePrimes = [2, 3, 5, 7, 11, 13, 17, 19, 23, 29]

    func testNotAsSimple() {
        let primeNumberGenerator = PrimeNumberGenerator()
        XCTAssertEqual(primeNumberGenerator.findPrimesThrough(value: 80), [2, 3, 5, 7, 11, 13, 17, 19, 23, 29, 31, 37, 41, 43, 47, 53, 59, 61, 67, 71, 73, 79])
    }

    func testNotAsSimpleYeah() {
        let primeNumberGenerator = PrimeNumberGenerator()
        XCTAssertEqual(primeNumberGenerator.findPrimesTheEratosthenesWayThrough(value: 80), [2, 3, 5, 7, 11, 13, 17, 19, 23, 29, 31, 37, 41, 43, 47, 53, 59, 61, 67, 71, 73, 79])
    }
    
}
