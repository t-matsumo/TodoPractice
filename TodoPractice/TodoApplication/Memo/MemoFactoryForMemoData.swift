//
//  MemoFactoryForMemoData.swift
//  TodoPractice
//
//  Created by tatsuki_matsumoto on 2021/02/13.
//

import Foundation

class MemoFactoryForMemoData {
    static func create(memoData: MemoData) -> Memo {
        Memo(title: memoData.title, content: memoData.content)
    }
}
