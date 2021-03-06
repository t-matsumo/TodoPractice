//
//  MemoListModelTest.swift
//  TodoPracticeTests
//
//  Created by tatsuki_matsumoto on 2021/02/12.
//

import XCTest
@testable import TodoPractice

class MemoListModelTest: XCTestCase {
    func testInstansiate() throws {
        let memoCellDataArray = (1...40).compactMap { n -> MemoCellData in
            let memo = Memo(title: "title\(n)", content: "content\(n)")
            let memoData = MemoData(title: memo.title, content: memo.content)
            return MemoCellData(memoData: memoData)
        }
        let model = MemoListModel()
        model.memoCellDataArray = memoCellDataArray
        XCTAssertTrue(zip(model.memoCellDataArray, memoCellDataArray).allSatisfy { memoData, memo in memoData.title == memo.title && memoData.content == memo.content })
    }
    
    func testNumberOfRowsInSection() {
        let memoCellDataArray = (1...40).compactMap { n -> MemoCellData in
            let memo = Memo(title: "title\(n)", content: "content\(n)")
            let memoData = MemoData(title: memo.title, content: memo.content)
            return MemoCellData(memoData: memoData)
        }
        let model = MemoListModel()
        XCTAssertEqual(model.numberOfRowsInSection(), 0)
        model.memoCellDataArray = memoCellDataArray
        XCTAssertEqual(model.numberOfRowsInSection(), memoCellDataArray.count)
    }
}
