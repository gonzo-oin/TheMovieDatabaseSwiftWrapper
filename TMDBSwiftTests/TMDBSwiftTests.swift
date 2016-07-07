//
//  TMDBSwiftTests.swift
//  TMDBSwiftTests
//
//  Created by George on 2016-04-07.
//  Copyright © 2016 George. All rights reserved.
//

import XCTest
@testable import TMDBSwift

class TMDBSwiftTests: XCTestCase {
  var key = "8a7a49369d1af6a70ec5a6787bbfcf79"
  
  
  //MARK: CollectionMDB Test
  
  func testCollection() {
    var data: CollectionMDB?
    let expectation = expectationWithDescription("Wait for data to load.")
    
    
    CollectionMDB.collection(key, collectionId: 10){
      coll in
      data = coll.data
      expectation.fulfill()
    }
    
    waitForExpectationsWithTimeout(5, handler: nil)
    XCTAssertNotNil(data)
    
    XCTAssertEqual(data?.id, 10)
    XCTAssertEqual(data?.name, "Star Wars Collection")
    XCTAssertNotNil(data?.backdrop_path)
    XCTAssertNotNil(data?.overview)
    XCTAssertNotNil(data?.collectionItems)
    XCTAssertTrue(data?.collectionItems.count > 0)
    XCTAssertNotNil(data?.poster_path)
    
  }
  
  //MARK: Configuration
  
  func testConfiguration() {
    var data: ConfigurationMDB?
    let expectation = expectationWithDescription("Wait for data to load.")
    
    
    ConfigurationMDB.configuration(key){
      config in
      data = config.data
      expectation.fulfill()
    }
    
    waitForExpectationsWithTimeout(5, handler: nil)
    XCTAssertNotNil(data)
    XCTAssertTrue(data?.backdrop_sizes.count > 0)
    XCTAssertEqual(data?.base_url, "http://image.tmdb.org/t/p/")
    XCTAssertEqual(data?.secure_base_url, "https://image.tmdb.org/t/p/")
    XCTAssertTrue(data?.change_keys.count > 0)
    XCTAssertTrue(data?.logo_sizes.count > 0)
    XCTAssertTrue(data?.poster_sizes.count > 0)
    XCTAssertTrue(data?.still_sizes.count > 0)
    XCTAssertTrue(data?.logo_sizes.count > 0)
    
  }
  
  
  //MARK: Company
  
  func testCompany() {
    var data: CompanyMDB?
    let expectation = expectationWithDescription("Wait for data to load.")
    
    CompanyMDB.companyInfo(key, companyId: 5){
      company in
      data = company.data
      expectation.fulfill()
    }
    
    waitForExpectationsWithTimeout(5, handler: nil)
    XCTAssertNotNil(data)
    
    XCTAssertEqual(data?.id, 5)
    XCTAssertEqual(data?.name, "Columbia Pictures")
    XCTAssertNotNil(data?.logo_path)
    XCTAssertEqual(data?.homepage, "http://www.sonypictures.com/")
    XCTAssertNotNil(data?.description)
    XCTAssertNotNil(data?.headquarters)
    XCTAssertEqual(data?.parent_company?.name, "Sony Pictures Entertainment")
    XCTAssertEqual(data?.parent_company?.id, 5752)
    XCTAssertNotNil(data?.parent_company?.logo_path)
    
  }
  
  
}
