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
        
        func saveMemo(memo: Memo) { }
        
        func updateMemo(memo: Memo) {
            let index = self.memoArray.firstIndex { entity -> Bool in
                entity.id == memo.id
            }
            if let index = index {
                self.memoArray[index] = memo
            }
        }
        
        func removeMemo(id: String) { }
    }
    
    func testUpdateMemo() throws {
        let memo = Memo(title: "title", content: "content", id: NSUUID().uuidString)
        let repository = MockRepository()
        repository.memoArray = [memo]
        let usecase = UpdateMemoUseCase(repository: repository)
        
        let updateMemoData = MemoData(title: "title2", content: "content2", id: memo.id)
        usecase.update(memoData: updateMemoData) { errors in }
        
        XCTAssertNotEqual(repository.memoArray.first?.title, memo.title)
        XCTAssertNotEqual(repository.memoArray.first?.content, memo.content)
        XCTAssertEqual(repository.memoArray.first?.title, updateMemoData.title)
        XCTAssertEqual(repository.memoArray.first?.content, updateMemoData.content)
        XCTAssertTrue(repository.memoArray.count == 1)
    }
    
    func testFailUpdateMemoEmptyTitle() throws {
        let memo = Memo(title: "title", content: "content", id: NSUUID().uuidString)
        let repository = MockRepository()
        repository.memoArray = [memo]
        let useCase = UpdateMemoUseCase(repository: repository)

        let updateMemoData = MemoData(title: "", content: "content2", id: memo.id)
        let exp = expectation(description: "updateMemo")
        useCase.update(memoData: updateMemoData) { (errors) in
            XCTAssertTrue(errors.contains(.titleIsEmpty))
            XCTAssertTrue(repository.memoArray.count == 1)
            XCTAssertEqual(repository.memoArray.first?.title, memo.title)
            XCTAssertEqual(repository.memoArray.first?.content, memo.content)
            exp.fulfill()
        }

        waitForExpectations(timeout: 1.0, handler: nil)
    }
    
    func testFailUpdateMemoOverTitleLength() throws {
        let memo = Memo(title: "title", content: "content", id: NSUUID().uuidString)
        let repository = MockRepository()
        repository.memoArray = [memo]
        let useCase = UpdateMemoUseCase(repository: repository)

        let updateMemoData = MemoData(title: String(repeating: "a", count: 51), content: "content2", id: memo.id)
        let exp = expectation(description: "updateMemo")
        useCase.update(memoData: updateMemoData) { (errors) in
            XCTAssertTrue(errors.contains(.titleIsOverLimit))
            XCTAssertTrue(repository.memoArray.count == 1)
            XCTAssertEqual(repository.memoArray.first?.title, memo.title)
            XCTAssertEqual(repository.memoArray.first?.content, memo.content)
            exp.fulfill()
        }

        waitForExpectations(timeout: 1.0, handler: nil)
    }
    
    func testFailUpdateMemoOverContentLength() throws {
        let memo = Memo(title: "title", content: "content", id: NSUUID().uuidString)
        let repository = MockRepository()
        repository.memoArray = [memo]
        let useCase = UpdateMemoUseCase(repository: repository)

        let updateMemoData = MemoData(title: "title2", content: String(repeating: "a", count: 201), id: memo.id)
        let exp = expectation(description: "updateMemo")
        useCase.update(memoData: updateMemoData) { (errors) in
            XCTAssertTrue(errors.contains(.contentIsOverLimit))
            XCTAssertTrue(repository.memoArray.count == 1)
            XCTAssertEqual(repository.memoArray.first?.title, memo.title)
            XCTAssertEqual(repository.memoArray.first?.content, memo.content)
            exp.fulfill()
        }

        waitForExpectations(timeout: 1.0, handler: nil)
    }
    
    func testFailUpdateMemoOverContenAndTitletLength() throws {
        let memo = Memo(title: "title", content: "content", id: NSUUID().uuidString)
        let repository = MockRepository()
        repository.memoArray = [memo]
        let useCase = UpdateMemoUseCase(repository: repository)

        let updateMemoData = MemoData(title: String(repeating: "a", count: 51), content: String(repeating: "a", count: 201), id: memo.id)
        let exp = expectation(description: "updateMemo")
        useCase.update(memoData: updateMemoData) { (errors) in
            XCTAssertTrue(errors.contains(.contentIsOverLimit))
            XCTAssertTrue(errors.contains(.titleIsOverLimit))
            XCTAssertTrue(repository.memoArray.count == 1)
            XCTAssertEqual(repository.memoArray.first?.title, memo.title)
            XCTAssertEqual(repository.memoArray.first?.content, memo.content)
            exp.fulfill()
        }

        waitForExpectations(timeout: 1.0, handler: nil)
    }
}
