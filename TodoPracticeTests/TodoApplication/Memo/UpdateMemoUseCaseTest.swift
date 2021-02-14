//
//  UpdateMemoUseCaseTest.swift
//  TodoPracticeTests
//
//  Created by tatsuki_matsumoto on 2021/02/13.
//

import XCTest
@testable import TodoPractice

class UpdateMemoUseCaseTest: XCTestCase {
    private class MockRepository : MemoRepository {
        var memoArray: [Memo] = []
        
        func getMemos(completion: @escaping ([Memo]) -> Void) { }
        
        func saveMemo(memo: Memo, completion: @escaping () -> Void) { }
        
        func updateMemo(memo: Memo, completion: @escaping () -> Void) {
            let index = self.memoArray.firstIndex { entity -> Bool in
                entity.id == memo.id
            }
            if let index = index {
                self.memoArray[index] = memo
            }
        }
        
        func removeMemo(id: String, completion: @escaping () -> Void) { }
    }
    
    func testUpdateMemo() throws {
        let memo = Memo(title: "title", content: "content", id: NSUUID().uuidString)
        let repository = MockRepository()
        repository.memoArray = [memo]
        let usecase = UpdateMemoUseCase(repository: repository)
        
        let updateMemoData = MemoData(title: "title2", content: "content2", id: memo.id)
        usecase.update(memoData: updateMemoData) {}
        
        XCTAssertNotEqual(repository.memoArray.first?.title, memo.title)
        XCTAssertNotEqual(repository.memoArray.first?.content, memo.content)
        XCTAssertEqual(repository.memoArray.first?.title, updateMemoData.title)
        XCTAssertEqual(repository.memoArray.first?.content, updateMemoData.content)
        XCTAssertTrue(repository.memoArray.count == 1)
    }
}
