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
    
    init(memoData: MemoData) {
        self.title = memoData.title
        self.content = memoData.content
    }
}
