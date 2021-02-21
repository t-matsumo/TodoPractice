//
//  MemoData.swift
//  TodoPractice
//
//  Created by tatsuki_matsumoto on 2021/02/11.
//

import Foundation

class MemoData {
    let title: String
    let content: String
    let id: String?
    let order: Double?
    
    init(title: String, content: String, order: Double? = nil, id: String? = nil) {
        self.title = title
        self.content = content
        self.id = id
        self.order = order
    }
}
