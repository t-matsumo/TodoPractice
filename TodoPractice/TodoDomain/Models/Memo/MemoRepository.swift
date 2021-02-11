//
//  MemoRepository.swift
//  TodoPractice
//
//  Created by tatsuki_matsumoto on 2021/02/11.
//

import Foundation

protocol MemoRepository {
    func getMemos() -> [Memo]
}
