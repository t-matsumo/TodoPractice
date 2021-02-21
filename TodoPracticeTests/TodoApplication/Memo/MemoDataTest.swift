//
//  MemoDataTest.swift
//  TodoPracticeTests
//
//  Created by tatsuki_matsumoto on 2021/02/11.
//

import XCTest
@testable import TodoPractice

class MemoDataTest: XCTestCase {
    func testInstantiate() throws {
        let title = "title"
        let content = "content"
        let order = 65535.0
        let memoData = MemoData(title: title, content: content)
        XCTAssertEqual(memoData.title, title)
        XCTAssertEqual(memoData.content, content)
        XCTAssertNil(memoData.order)
        XCTAssertNil(memoData.id)
        
        
        let memoData2 = MemoData(title: title, content: content, order: order)
        XCTAssertEqual(memoData2.title, title)
        XCTAssertEqual(memoData2.content, content)
        XCTAssertEqual(memoData2.order, order)
        XCTAssertNil(memoData2.id)
    }
}
