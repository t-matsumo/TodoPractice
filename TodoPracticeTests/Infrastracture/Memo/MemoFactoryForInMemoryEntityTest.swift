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
        guard let memo = MemoFactoryForInMemoryEntity.create(entity: entity) else {
            XCTAssertTrue(false, "Instantiation erroe")
            return
        }
        XCTAssertEqual(memo.title, entity.title)
        XCTAssertEqual(memo.content, entity.content)
    }
}
