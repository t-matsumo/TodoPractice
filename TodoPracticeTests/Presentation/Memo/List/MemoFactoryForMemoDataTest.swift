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
        XCTAssertNil(memo.id)
    }
    
    func testCreateMemoWithId() throws {
        let originalMemo = Memo(title: "title", content: "content", id: NSUUID().uuidString)
        let memoData = MemoData(title: originalMemo.title, content: originalMemo.content, id: originalMemo.id)
        let memo = MemoFactoryForMemoData.create(memoData: memoData)
        XCTAssertEqual(memo.title, originalMemo.title)
        XCTAssertEqual(memo.content, originalMemo.content)
        XCTAssertEqual(memo.id, originalMemo.id)
    }
}
