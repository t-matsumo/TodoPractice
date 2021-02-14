//
//  CreateMemoUseCaseTest.swift
//  TodoPracticeTests
//
//  Created by tatsuki_matsumoto on 2021/02/13.
//

import XCTest
@testable import TodoPractice

class SaveMemoUseCaseTest: XCTestCase {
    private class MockRepository : MemoRepository {
        var memoArray: [Memo] = []
        
        func getMemos(completion: @escaping ([Memo]) -> Void) { }
        
        func saveMemo(memo: Memo, completion: @escaping () -> Void) {
            self.memoArray.append(memo)
        }
        
        func updateMemo(memo: Memo, completion: @escaping () -> Void) { }
        
        func removeMemo(id: String, completion: @escaping () -> Void) { }
    }
    
    func testSaveMemo() throws {
        let repository = MockRepository()
        repository.memoArray = []
        let useCase = SaveMemoUseCase(repository: repository)
        
        let memo = Memo(title: "title", content: "content")
        let memoData = MemoData(title: memo.title, content: memo.content)
        useCase.save(memoData: memoData) { }
        
        XCTAssertEqual(repository.memoArray.count, 1)
        XCTAssertEqual(repository.memoArray.first!.title, memo.title)
        XCTAssertEqual(repository.memoArray.first!.content, memo.content)
    }
}
