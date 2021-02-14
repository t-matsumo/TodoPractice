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
        
        func saveMemo(memo: Memo) {
            self.memoArray.append(memo)
        }
        
        func updateMemo(memo: Memo) { }
        
        func removeMemo(id: String) { }
    }
    
    func testSaveMemo() throws {
        let repository = MockRepository()
        repository.memoArray = []
        let useCase = SaveMemoUseCase(repository: repository)
        
        let memo = Memo(title: "title", content: "content")
        let memoData = MemoData(title: memo.title, content: memo.content)
        useCase.save(memoData: memoData) { errors in }
        
        XCTAssertEqual(repository.memoArray.count, 1)
        XCTAssertEqual(repository.memoArray.first!.title, memo.title)
        XCTAssertEqual(repository.memoArray.first!.content, memo.content)
    }
    
    func testFailSaveMemoEmptyTitle() throws {
        let repository = MockRepository()
        repository.memoArray = []
        let useCase = SaveMemoUseCase(repository: repository)
        
        let memoData = MemoData(title: "", content: "content")
        let exp = expectation(description: "saveMemo")
        useCase.save(memoData: memoData) { (saveErrors) in
            XCTAssertTrue(saveErrors.contains(.titleIsEmpty))
            XCTAssertTrue(repository.memoArray.count == 0)
            exp.fulfill()
        }
        
        waitForExpectations(timeout: 1.0, handler: nil)
    }
    
    func testFailSaveMemoOverTitleLength() throws {
        let repository = MockRepository()
        repository.memoArray = []
        let useCase = SaveMemoUseCase(repository: repository)
        
        let memoData = MemoData(title: String(repeating: "a", count: 51), content: "content")
        let exp = expectation(description: "saveMemo")
        useCase.save(memoData: memoData) { (saveErrors) in
            XCTAssertTrue(saveErrors.contains(.titleIsOverLimit))
            XCTAssertTrue(repository.memoArray.count == 0)
            exp.fulfill()
        }
        
        waitForExpectations(timeout: 1.0, handler: nil)
    }
    
    func testFailSaveMemoOverContentLength() throws {
        let repository = MockRepository()
        repository.memoArray = []
        let useCase = SaveMemoUseCase(repository: repository)
        
        let memoData = MemoData(title: "title", content: String(repeating: "a", count: 201))
        let exp = expectation(description: "saveMemo")
        useCase.save(memoData: memoData) { (saveErrors) in
            XCTAssertTrue(saveErrors.contains(.contentIsOverLimit))
            XCTAssertTrue(repository.memoArray.count == 0)
            exp.fulfill()
        }
        
        waitForExpectations(timeout: 1.0, handler: nil)
    }
    
    func testFailSaveMemoOverContenAndTitletLength() throws {
        let repository = MockRepository()
        repository.memoArray = []
        let useCase = SaveMemoUseCase(repository: repository)
        
        let memoData = MemoData(title: String(repeating: "a", count: 51), content: String(repeating: "a", count: 201))
        let exp = expectation(description: "saveMemo")
        useCase.save(memoData: memoData) { (saveErrors) in
            XCTAssertTrue(saveErrors.contains(.contentIsOverLimit))
            XCTAssertTrue(saveErrors.contains(.titleIsOverLimit))
            XCTAssertTrue(repository.memoArray.count == 0)
            exp.fulfill()
        }
        
        waitForExpectations(timeout: 1.0, handler: nil)
    }
}
