//
//  MemoRepository.swift
//  TodoPractice
//
//  Created by tatsuki_matsumoto on 2021/02/11.
//

import Foundation

protocol MemoRepository {
    func getMemos(completion: @escaping ([Memo]) -> Void)
    func saveMemo(memo: Memo)
    func updateMemo(memo: Memo)
}
