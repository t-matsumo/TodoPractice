//
//  MemoFactoryForMemoDataTest.swift
//  TodoPracticeTests
//
//  Created by tatsuki_matsumoto on 2021/02/13.
//

import XCTest
@testable import TodoPractice

class MemoFactoryForMemoDataTest: XCTestCase {
    func testCreateMemo() throws {
        let originalMemo = Memo(title: "title", content: "content")
        let memoData = MemoData(title: originalMemo.title, content: originalMemo.content)
        let memo = MemoFactoryForMemoData.create(memoData: memoData)
        XCTAssertEqual(memo.title, originalMemo.title)
        XCTAssertEqual(memo.content, originalMemo.content)
        XCTAssertNil(memo.order)
        XCTAssertNil(memo.id)
    }
    
    func testCreateMemoWithOrderAndId() throws {
        let originalMemo = Memo(title: "title", content: "content", order: 65535.0, id: NSUUID().uuidString)
        let memoData = MemoData(title: originalMemo.title, content: originalMemo.content, order: originalMemo.order, id: originalMemo.id)
        let memo = MemoFactoryForMemoData.create(memoData: memoData)
        XCTAssertEqual(memo.title, originalMemo.title)
        XCTAssertEqual(memo.content, originalMemo.content)
        XCTAssertEqual(memo.order, originalMemo.order)
        XCTAssertEqual(memo.id, originalMemo.id)
    }
}
