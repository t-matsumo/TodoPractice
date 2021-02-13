//
//  UpdateMemoViewModelTest.swift
//  TodoPracticeTests
//
//  Created by tatsuki_matsumoto on 2021/02/13.
//

import XCTest
@testable import TodoPractice

class UpdateMemoViewModelTest: XCTestCase {
    func testInstantiate() throws {
        let memoData = MemoData(title: "title", content: "conetnt", id: NSUUID().uuidString)
        let viewModel = UpdateMemoViewModel(memoData: memoData)
        XCTAssertEqual(viewModel.title, memoData.title)
        XCTAssertEqual(viewModel.content, memoData.content)
        XCTAssertEqual(viewModel.id, memoData.id)
    }
}
