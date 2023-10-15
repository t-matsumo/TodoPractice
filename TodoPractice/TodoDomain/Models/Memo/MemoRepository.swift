//
//  MemoRepository.swift
//  TodoPractice
//
//  Created by tatsuki_matsumoto on 2021/02/11.
//

import Foundation

protocol MemoRepository {
    func getMemos() async -> [Memo]
    /// completion処理完了後に呼ばれる
    func saveMemo(memo: Memo) async
    /// completion処理完了後に呼ばれる
    func removeMemo(id: String) async
}
