//
//  SaveMemoUseCase.swift
//  TodoPractice
//
//  Created by tatsuki_matsumoto on 2021/02/13.
//

import Foundation

struct SaveMemoUseCaseRequest {
    let title: String
    let content: String
}

class SaveMemoUseCase {
    private let repository: MemoRepository
    
    init(repository: MemoRepository) {
        self.repository = repository
    }
    
    func execute(_ request: SaveMemoUseCaseRequest) async throws {
        let memo = Memo(
            title: request.title,
            content: request.content,
            id: self.repository.createId()
        )

        try await self.repository.save(memo)
    }
}
