//
//  GetMemoListUseCase.swift
//  TodoPracticeTests
//
//  Created by tatsuki_matsumoto on 2021/02/11.
//

import XCTest
@testable import TodoPractice

class GetMemoListUseCaseTest: XCTestCase {
    private class MockRepository : MemoRepository {
        let memoArray: [Memo]
        init(memoArray: [Memo]) {
            self.memoArray = memoArray
        }
        func getMemos() -> [Memo] {
            self.memoArray
        }
    }
    
    func testGetAllMemos() throws {
        let memoArray = (1...40).compactMap { n in Memo(title: "title\(n)", content: "content\(n)") }
        let repository = MockRepository(memoArray: memoArray)
        let useCase = GetMemoUseCase(memoRepository: repository)
        let memoDataArray = useCase.getMemos()
        
        XCTAssertTrue(zip(memoDataArray, memoArray).allSatisfy { memoData, memo in memoData.title == memo.title && memoData.content == memo.content })
    }
}
