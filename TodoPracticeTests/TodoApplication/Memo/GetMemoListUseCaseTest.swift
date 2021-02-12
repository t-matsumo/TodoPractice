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
        func getMemos(completion: @escaping ([Memo]) -> Void) {
            completion(self.memoArray)
        }
        
        let memoArray: [Memo]
        init(memoArray: [Memo]) {
            self.memoArray = memoArray
        }
    }
    
    func testGetAllMemos() throws {
        let memoArray = (1...40).compactMap { n in Memo(title: "title\(n)", content: "content\(n)") }
        let repository = MockRepository(memoArray: memoArray)
        let useCase = GetMemoUseCase(memoRepository: repository)
        
        let exp = expectation(description: "getMemo")
        useCase.getMemos { (memoDataArray) in
            XCTAssertTrue(zip(memoDataArray, memoArray).allSatisfy { memoData, memo in memoData.title == memo.title && memoData.content == memo.content })
            exp.fulfill()
        }
        
        waitForExpectations(timeout: 1.0, handler: nil)
    }
}
