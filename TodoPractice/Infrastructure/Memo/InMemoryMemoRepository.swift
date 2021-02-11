//
//  InMemoryMemoRepository.swift
//  TodoPractice
//
//  Created by tatsuki_matsumoto on 2021/02/11.
//

import Foundation

class InMemoryMemoRepository : MemoRepository {
    let database = (1...40).compactMap { n in Memo(title: "title\(n)", content: "content\(n)") }
    func getMemos() -> [Memo] {
        sleep(2)
        return self.database
    }
}
