//
//  ChallengeLibreTests.swift
//  ChallengeLibreTests
//
//  Created by Julian González on 3/06/22.
//

import XCTest
@testable import ChallengeLibre

class ChallengeLibreTests: XCTestCase {
    
    var api: ApiService?
    var viewModel: ListProductsViewModel?

    override func setUp() {
        super.setUp()
        
        api = ApiService()
        viewModel = ListProductsViewModel()
        
    }
    
    func testSearchApi() throws {
        
        let expectationWait = expectation(description: "success request api")
        
        api?.apiGetSearchProduct(txtProduct: "play 5") { data in
            
            expectationWait.fulfill()
            XCTAssertNotNil(data)
            XCTAssertNotNil(data.data)
            XCTAssertEqual(data.response?.statusCode, 201)
            XCTAssertEqual(data.response?.statusCode, 200)
            
        }
        
        waitForExpectations(timeout: 5, handler: nil)
        
    }
    
    func testDecodeModel() throws {
        
        let expectationWait = expectation(description: "success decode model")
        
        viewModel?.getSearchProductTxt(txtProduct: "nike") { data in
            
            expectationWait.fulfill()
            XCTAssertNotNil(data)
            XCTAssertEqual(data.count, 50)
            
        }
        
        waitForExpectations(timeout: 5, handler: nil)
        
    }
    
    
    
    
    
    
    override func tearDown() {
        super.tearDown()
        
        api = nil
        viewModel = nil
        
    }

}
