//
//  InMemoryMemoEntityTest.swift
//  TodoPracticeTests
//
//  Created by tatsuki_matsumoto on 2021/02/13.
//

import XCTest
@testable import TodoPractice

class InMemoryMemoEntityTest: XCTestCase {
    func testInstantiate() throws {
        let title = "title"
        let content = "content"
        let order = 100000.0

        let entity = InMemoryMemoEntity(title: title, content: content, order: order)
        XCTAssertEqual(entity.title, title)
        XCTAssertEqual(entity.content, content)
        XCTAssertEqual(entity.order, order)
        XCTAssertNotNil(entity.id)
    }
    
    func testInstantiateWithMemo() throws {
        // for create and change order
        let order = 100000.0
        let memo = Memo(title: "title", content: "content")
        let entity = InMemoryMemoEntity(memo: memo, order: order)
        XCTAssertEqual(entity.title, memo.title)
        XCTAssertEqual(entity.content, memo.content)
        XCTAssertEqual(entity.order, order)
        XCTAssertNotNil(entity.id)
    }
    
    func testInstantiateWithMemoHoldsId() throws {
        // for update
        let memo = Memo(title: "title", content: "content", order: 65535.0, id: UUID().uuidString)
        let entity = InMemoryMemoEntity(memo: memo)
        XCTAssertEqual(entity.title, memo.title)
        XCTAssertEqual(entity.content, memo.content)
        XCTAssertEqual(entity.order, memo.order)
        XCTAssertEqual(entity.id, memo.id)
    }
}
