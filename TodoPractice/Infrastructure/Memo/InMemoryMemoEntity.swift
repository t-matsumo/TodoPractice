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
    let id: String
    let order: Double
    
    // testでしか使用していない疑惑...
    init(title: String, content: String, order: Double) {
        self.title = title
        self.content = content
        self.id = NSUUID().uuidString
        self.order = order
    }
    
    /// order is prior to memo.id
    init(memo: Memo, order: Double? = nil) {
        precondition(memo.id != nil || order != nil)
        
        self.title = memo.title
        self.content = memo.content
        self.id = memo.id ?? NSUUID().uuidString
        self.order = order ?? memo.order!
    }
}
