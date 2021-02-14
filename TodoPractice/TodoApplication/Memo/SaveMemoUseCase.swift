//
//  SaveMemoUseCase.swift
//  TodoPractice
//
//  Created by tatsuki_matsumoto on 2021/02/13.
//

import Foundation

class SaveMemoUseCase {
    private let repository: MemoRepository
    
    init(repository: MemoRepository) {
        self.repository = repository
    }
    
    func save(memoData: MemoData, completionHandler: @escaping () -> Void) {
        self.repository.saveMemo(memo: MemoFactoryForMemoData.create(memoData: memoData)) {
            completionHandler()
        }
    }
}
