//
//  GetMemoUseCase.swift
//  TodoPractice
//
//  Created by tatsuki_matsumoto on 2021/02/11.
//

import Foundation

class GetAllMemoUseCase {
    private let repository: MemoRepository
    
    init(memoRepository: MemoRepository) {
        self.repository = memoRepository
    }
    
    func execute() async -> [MemoData] {
        return await self.repository.getAll().map {
            MemoData(
                title: $0.title,
                content: $0.content,
                id: $0.id
            )
        }
    }
}
