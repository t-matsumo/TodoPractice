//
//  InMemoryMemoEntity.swift
//  TodoPractice
//
//  Created by tatsuki_matsumoto on 2021/02/13.
//

import Foundation

struct InMemoryMemoEntity {
    let title: String
    let content: String
    let id: String
    
    init(title: String, content: String) {
        self.title = title
        self.content = content
        self.id = NSUUID().uuidString
    }
    
    init(memo: Memo) {
        self.title = memo.title
        self.content = memo.content
        self.id = memo.id
    }
}
