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
     
    init(title: String, content: String) {
        precondition(1...200 ~= title.count)
        
        self.title = title
        self.content = content
    }
    
    
}
