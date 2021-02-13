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
        let entity = InMemoryMemoEntity(title: title, content: content)
        XCTAssertEqual(entity.title, title)
        XCTAssertEqual(entity.content, content)
        XCTAssertNotNil(entity.id)
    }
    
    func testInstantiateWithMemo() throws {
        let memo = Memo(title: "title", content: "content")
        let entity = InMemoryMemoEntity(memo: memo)
        XCTAssertEqual(entity.title, memo.title)
        XCTAssertEqual(entity.content, memo.content)
        XCTAssertNotNil(entity.id)
    }
}
