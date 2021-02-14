//
//  MemoTest.swift
//  TodoPracticeTests
//
//  Created by tatsuki_matsumoto on 2021/02/11.
//

import XCTest
@testable import TodoPractice

class MemoTest: XCTestCase {
    private let title = "title"
    private let content = "content"
    
    func testInstantiate() throws {
        let memo = Memo(title: self.title, content: self.content)
        XCTAssertEqual(memo.title, title)
        XCTAssertEqual(memo.content, content)
        XCTAssertNil(memo.id)
    }

    func testTitleIsAtLeastOneCharacter() throws {
        XCTAssertNotNil(Memo(title: "1", content: content))
        // check with `precondition`
//        XCTAssertThrowsError(Memo(title: "", content: content))
    }
    
    func testTitleIsAtMost50Character() throws {
        XCTAssertNotNil(Memo(title: String(repeating: "a", count: 50), content: content))
        // check with `precondition`
//        XCTAssertNil(Memo(title: String(repeating: "a", count: 51), content: content))
    }
    
    func testContentIsAtLeastZeroCharacter() throws {
        XCTAssertNotNil(Memo(title: "title", content: ""))
    }
    
    func testContentIsAtMost200Character() throws {
        XCTAssertNotNil(Memo(title: "title", content: String(repeating: "a", count: 200)))
        // check with `precondition`
//        XCTAssertNotNil(Memo(title: "title", content: String(repeating: "a", count: 201)))
    }
}
