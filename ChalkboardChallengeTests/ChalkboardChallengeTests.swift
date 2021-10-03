//
//  ChalkboardChallengeTests.swift
//  ChalkboardChallengeTests
//
//  Created by Darren Gillman on 03/10/2021.
//

import XCTest
@testable import ChalkboardChallenge



class ChalkboardChallengeTests: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

   func testUserInit() {
      let first = "David"
      let last = "Smith"
      let title = "Mr"
      
      let date = "some old date"
      let age = 42
      
      let identify = User.Identity(title: title, first: first, last: last)
      let dob = User.DOB(date: date, age: age)
      
      let user = User(identity: identify , dob: dob )
      
      XCTAssert(user.identity == identify)
      XCTAssertEqual(user.dob, dob)
   }
   
   func testUserCodableImplmentation() {
      let users =  try? JSONDecoder().decode(Results.self, from: Data(TestData.json.utf8)).results
      XCTAssertNotNil(users)
      XCTAssertEqual(users!.count, 1000)
   }

}
