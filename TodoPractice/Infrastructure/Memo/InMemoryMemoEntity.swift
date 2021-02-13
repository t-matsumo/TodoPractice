//
//  InMemoryMemoEntity.swift
//  TodoPractice
//
//  Created by tatsuki_matsumoto on 2021/02/13.
//

import Foundation

class InMemoryMemoEntity {
    let title: String
    let content: String
    let id = NSUUID().uuidString
    
    init(title: String, content: String) {
        self.title = title
        self.content = content
    }
    
    init(memo: Memo) {
        self.title = memo.title
        self.content = memo.content
    }
}
