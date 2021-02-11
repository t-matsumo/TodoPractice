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
    
    init(memo: Memo) {
        self.title = memo.title
        self.content = memo.content
    }
}
