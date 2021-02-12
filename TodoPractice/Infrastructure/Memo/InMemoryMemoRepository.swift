//
//  InMemoryMemoRepository.swift
//  TodoPractice
//
//  Created by tatsuki_matsumoto on 2021/02/11.
//

import Foundation

class InMemoryMemoRepository : MemoRepository {
    let database = (1...40).compactMap { n in InMemoryMemoEntity(title: "title\(n)", content: "content\(n)") }
    func getMemos(completion: @escaping ([Memo]) -> Void) {
        DispatchQueue.global().async { [weak self] in
            sleep(2)
            completion(self?.database.compactMap(MemoFactoryForInMemoryEntity.create) ?? [])
        }
    }
}
