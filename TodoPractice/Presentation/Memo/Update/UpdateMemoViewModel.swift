//
//  UpdateMemoViewModel.swift
//  TodoPractice
//
//  Created by tatsuki_matsumoto on 2021/02/13.
//

import Foundation

class UpdateMemoViewModel {
    let title: String
    let content: String
    let id: MemoId
    
    init(memoData: MemoData) {
        self.title = memoData.title
        self.content = memoData.content
        self.id = memoData.id
    }
}
