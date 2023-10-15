//
//  GetMemoUseCase.swift
//  TodoPractice
//
//  Created by tatsuki_matsumoto on 2021/02/11.
//

import Foundation

class GetMemoUseCase {
    private let repository: MemoRepository
    
    init(memoRepository: MemoRepository) {
        self.repository = memoRepository
    }
    
    func getMemos() async -> [MemoData] {
        let memos = await self.repository.getMemos()
        return memos.map { MemoData(title: $0.title, content: $0.content, id: $0.id) }
    }
}
