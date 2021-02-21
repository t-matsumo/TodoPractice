//
//  MemoCellData.swift
//  TodoPractice
//
//  Created by tatsuki_matsumoto on 2021/02/13.
//

import Foundation

class MemoCellData {
    let title: String
    let content: String
    let id: String
    let order: Double

    init(memoData: MemoData) {
        precondition(memoData.id != nil)
        precondition(memoData.order != nil)
        
        self.title = memoData.title
        self.content = memoData.content
        self.id = memoData.id!
        self.order = memoData.order!
    }
}
