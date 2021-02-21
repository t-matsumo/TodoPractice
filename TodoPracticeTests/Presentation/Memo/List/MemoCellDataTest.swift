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
        let memo = Memo(title: "title", content: "content", order: 65535, id: UUID().uuidString)
        let memoData = MemoData(title: memo.title, content: memo.content, order: memo.order, id: memo.id)
        let cellData = MemoCellData(memoData: memoData)
        XCTAssertEqual(cellData.title, memo.title)
        XCTAssertEqual(cellData.content, memo.content)
        XCTAssertEqual(cellData.order, memo.order)
        XCTAssertEqual(cellData.id, memo.id)
    }
}
