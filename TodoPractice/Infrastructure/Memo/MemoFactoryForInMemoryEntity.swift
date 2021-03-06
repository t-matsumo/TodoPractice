//
//  MemoFactoryForInMemoryEntity.swift
//  TodoPractice
//
//  Created by tatsuki_matsumoto on 2021/02/13.
//

import Foundation

class MemoFactoryForInMemoryEntity {
    static func create(entity: InMemoryMemoEntity) -> Memo {
        Memo(title: entity.title, content: entity.content, id: entity.id)
    }
}
