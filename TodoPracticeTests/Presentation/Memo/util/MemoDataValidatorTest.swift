//
//  MemoDataValidatorTest.swift
//  TodoPracticeTests
//
//  Created by tatsuki_matsumoto on 2021/02/13.
//

import XCTest
@testable import TodoPractice

class MemoDataValidatorTest: XCTestCase {
    var memoDataValidator: MemoDataValidator!
    
    override func setUpWithError() throws {
        memoDataValidator = MemoDataValidator()
    }
    
    func testValidateTitleLength() throws {
        var result = memoDataValidator.validate(memoData: MemoData(title: "", content: "content"))
        XCTAssertTrue(result.contains(.titleIsEmpty))
        
        result = memoDataValidator.validate(memoData: MemoData(title: "a", content: "content"))
        XCTAssertTrue(result.isEmpty)
        
        result = memoDataValidator.validate(memoData: MemoData(title: String(repeating: "a", count: 50), content: "content"))
        XCTAssertTrue(result.isEmpty)
        
        result = memoDataValidator.validate(memoData: MemoData(title: String(repeating: "a", count: 51), content: "content"))
        XCTAssertTrue(result.contains(.titleIsOverLimit))
    }
    
    func testValidateContentLength() throws {
        var result = memoDataValidator.validate(memoData: MemoData(title: "a", content: ""))
        XCTAssertTrue(result.isEmpty)
        
        result = memoDataValidator.validate(memoData: MemoData(title: "a", content: String(repeating: "a", count: 200)))
        XCTAssertTrue(result.isEmpty)
        
        result = memoDataValidator.validate(memoData: MemoData(title: "a", content: String(repeating: "a", count: 201)))
        XCTAssertTrue(result.contains(.contentIsOverLimit))
    }
    
    func testValidateHaveErrors() throws {
        var result = memoDataValidator.validate(memoData: MemoData(title: "", content: String(repeating: "a", count: 201)))
        XCTAssertTrue(result.contains(.titleIsEmpty))
        XCTAssertTrue(result.contains(.contentIsOverLimit))
        
        result = memoDataValidator.validate(memoData: MemoData(title: String(repeating: "a", count: 51), content: String(repeating: "a", count: 201)))
        XCTAssertTrue(result.contains(.titleIsOverLimit))
        XCTAssertTrue(result.contains(.contentIsOverLimit))
    }
}
