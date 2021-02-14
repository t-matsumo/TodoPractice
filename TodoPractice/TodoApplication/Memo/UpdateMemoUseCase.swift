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
    
    
    func update(memoData: MemoData, completionHandler: @escaping () -> Void) {
        self.repository.updateMemo(memo: MemoFactoryForMemoData.create(memoData: memoData)) {
            completionHandler()
        }
    }
}
