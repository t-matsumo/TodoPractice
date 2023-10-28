//
//  UpdateMemoUseCase.swift
//  TodoPractice
//
//  Created by tatsuki_matsumoto on 2021/02/13.
//

import Foundation

class UpdateMemoUseCase {
    let repository: MemoRepository
    
    init(repository: MemoRepository) {
        self.repository = repository
    }
    
    
    func update(memoData: MemoData) async throws {
        try await self.repository.save(MemoFactoryForMemoData.create(memoData: memoData))
    }
}
