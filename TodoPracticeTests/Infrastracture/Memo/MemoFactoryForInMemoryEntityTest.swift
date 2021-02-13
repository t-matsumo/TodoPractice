//
//  MemoFactoryForInMemoryEntityTest.swift
//  TodoPracticeTests
//
//  Created by tatsuki_matsumoto on 2021/02/13.
//

import XCTest
@testable import TodoPractice

class MemoFactoryForInMemoryEntityTest: XCTestCase {
    func testCreateMemo() throws {
        let entity = InMemoryMemoEntity(title: "title", content: "content")
        let memo = MemoFactoryForInMemoryEntity.create(entity: entity)
        XCTAssertEqual(memo.title, entity.title)
        XCTAssertEqual(memo.content, entity.content)
    }
}
