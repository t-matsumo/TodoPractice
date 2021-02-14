//
//  RemoveMemoUseCase.swift
//  TodoPractice
//
//  Created by tatsuki_matsumoto on 2021/02/14.
//

import Foundation

class RemoveMemoUseCase {
    let repository: MemoRepository
    
    init(repository: MemoRepository) {
        self.repository = repository
    }
    
    func remove(id: String) {
        self.repository.removeMemo(id: id)
    }
}
