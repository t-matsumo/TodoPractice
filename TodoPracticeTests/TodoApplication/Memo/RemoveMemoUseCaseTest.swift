//
//  RemoveMemoUseCaseTest.swift
//  TodoPracticeTests
//
//  Created by tatsuki_matsumoto on 2021/02/14.
//

import XCTest
@testable import TodoPractice

class RemoveMemoUseCaseTest: XCTestCase {
    private class MockRepository : MemoRepository {
        var memoArray: [Memo] = []
        
        func getMemos(completion: @escaping ([Memo]) -> Void) { }
        
        func saveMemo(memo: Memo, completion: @escaping () -> Void) { }
        
        func updateMemo(memo: Memo, completion: @escaping () -> Void) { }
        
        func removeMemo(id: String, completion: @escaping () -> Void) {
            self.memoArray.removeAll { $0.id == id }
        }
    }
    
    func testDelete() throws {
        let repository = MockRepository()
        let memo = Memo(title: "title", content: "content", id: NSUUID().uuidString)
        repository.memoArray = [memo]
        XCTAssertFalse(repository.memoArray.isEmpty)
        
        let useCase = RemoveMemoUseCase(repository: repository)
        useCase.remove(id: memo.id!) {}
        
        XCTAssertTrue(repository.memoArray.isEmpty)
    }
}
