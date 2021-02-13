//
//  MemoCellDataTest.swift
//  TodoPracticeTests
//
//  Created by tatsuki_matsumoto on 2021/02/13.
//

import XCTest
@testable import TodoPractice

class MemoCellDataTest: XCTestCase {
    func testInstansiate() throws {
        let memo = Memo(title: "title", content: "content")
        let memoData = MemoData(title: memo.title, content: memo.content)
        let cellData = MemoCellData(memoData: memoData)
        XCTAssertEqual(cellData.title, memo.title)
        XCTAssertEqual(cellData.content, memo.content)
    }
}
