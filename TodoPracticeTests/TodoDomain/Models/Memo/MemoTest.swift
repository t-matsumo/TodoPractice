//
//  MemoTest.swift
//  TodoPracticeTests
//
//  Created by tatsuki_matsumoto on 2021/02/11.
//

import XCTest
@testable import TodoPractice

class MemoTest: XCTestCase {
    let title = "title"
    let content = "content"
    
    func testMemoHasTitle() throws {
        guard let memo = Memo(title: self.title, content: self.content) else {
            XCTAssertTrue(false, "Instantiation erroe")
            return
        }

        XCTAssertEqual(memo.title, title)
    }
    
    func testMemoHasContent() throws {
        guard let memo = Memo(title: self.title, content: self.content) else {
            XCTAssertTrue(false, "Instantiation erroe")
            return
        }
        XCTAssertEqual(memo.content, content)
    }
    
    func testTitleIsAtLeastOneCharacter() throws {
        XCTAssertNotNil(Memo(title: "1", content: content))
        XCTAssertNil(Memo(title: "", content: content))
    }
    
    func testTitleIsAtMost200Character() throws {
        XCTAssertNotNil(Memo(title: String(repeating: "a", count: 200), content: content))
        XCTAssertNil(Memo(title: String(repeating: "a", count: 201), content: content))
    }
}
