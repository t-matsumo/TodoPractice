//
//  GetMemoUseCase.swift
//  TodoPractice
//
//  Created by tatsuki_matsumoto on 2021/02/11.
//

import Foundation

class GetMemoUseCase {
    let repository: MemoRepository
    init(memoRepository: MemoRepository) {
        self.repository = memoRepository
    }
    
    func getMemos() -> [Memo] {
        return self.repository.getMemos()
    }
}
