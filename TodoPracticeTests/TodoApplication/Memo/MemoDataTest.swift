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
        guard let memo = Memo(title: "title", content: "content") else {
            XCTAssertTrue(false, "Instantiation erroe")
            return
        }

        let memoData = MemoData(memo: memo)
        XCTAssertEqual(memoData.title, memo.title)
        XCTAssertEqual(memoData.content, memo.content)
    }
}
