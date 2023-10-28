//
//  UpdateMemoUseCase.swift
//  TodoPractice
//
//  Created by tatsuki_matsumoto on 2021/02/13.
//

import Foundation

struct UpdateMemoUseCaseRequest {
    let title: String
    let content: String
    let id: MemoId
}

class UpdateMemoUseCase {
    private let repository: MemoRepository
    
    init(repository: MemoRepository) {
        self.repository = repository
    }
    
    func execute(_ request: UpdateMemoUseCaseRequest) async throws {
        let memo = Memo(
            title: request.title,
            content: request.content,
            id: request.id
        )
        try await self.repository.save(memo)
    }
}
