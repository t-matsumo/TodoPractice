//
//  RemoveMemoUseCase.swift
//  TodoPractice
//
//  Created by tatsuki_matsumoto on 2021/02/14.
//

import Foundation

class RemoveMemoUseCase {
    private let repository: MemoRepository
    
    init(repository: MemoRepository) {
        self.repository = repository
    }
    
    func execute(by id: MemoId) async throws {
        guard let memo = await self.repository.find(by: id) else {
            return
        }
        try await self.repository.remove(memo)
    }
}
