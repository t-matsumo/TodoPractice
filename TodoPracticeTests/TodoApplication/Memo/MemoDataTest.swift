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
        let memoData = MemoData(title: title, content: content)
        XCTAssertEqual(memoData.title, title)
        XCTAssertEqual(memoData.content, content)
    }
}
