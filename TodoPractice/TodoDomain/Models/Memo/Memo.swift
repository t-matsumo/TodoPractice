//
//  Memo.swift
//  TodoPractice
//
//  Created by tatsuki_matsumoto on 2021/02/11.
//

import Foundation

class Memo {
    let title: String
    let content: String
    let id: String?
     
    init(title: String, content: String, id: String? = nil) {
        precondition(1...50 ~= title.count)
        precondition(0...200 ~= content.count)
        
        self.title = title
        self.content = content
        self.id = id
    }
}
