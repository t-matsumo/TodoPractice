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
        let memoDataArray = (1...40).compactMap { n -> MemoData? in
            guard let memo = Memo(title: "title\(n)", content: "content\(n)") else {
                return nil
            }
            return MemoData(memo: memo)
        }
        let model = MemoListModel()
        model.memoDataArray = memoDataArray
        XCTAssertTrue(zip(model.memoDataArray, memoDataArray).allSatisfy { memoData, memo in memoData.title == memo.title && memoData.content == memo.content })
    }
}
