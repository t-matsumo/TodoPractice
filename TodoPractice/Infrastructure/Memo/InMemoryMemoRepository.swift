//
//  InMemoryMemoRepository.swift
//  TodoPractice
//
//  Created by tatsuki_matsumoto on 2021/02/11.
//

import Foundation

class InMemoryMemoRepository : MemoRepository {
    private static let dataAccessQueue = DispatchQueue(label: "dataAccessQueue")
    private static var database = (1...40).compactMap { n in InMemoryMemoEntity(title: "title\(n)", content: "content\(n)") }
    
    func getMemos(completion: @escaping ([Memo]) -> Void) {
        InMemoryMemoRepository.dataAccessQueue.async {
            sleep(1)
            completion(InMemoryMemoRepository.database.compactMap(MemoFactoryForInMemoryEntity.create).reversed())
        }
    }
    
    func saveMemo(memo: Memo) {
        InMemoryMemoRepository.dataAccessQueue.async {
            sleep(1)
            InMemoryMemoRepository.database.append(InMemoryMemoEntity(memo: memo))
        }
    }
}
