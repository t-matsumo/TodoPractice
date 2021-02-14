//
//  MemoRepository.swift
//  TodoPractice
//
//  Created by tatsuki_matsumoto on 2021/02/11.
//

import Foundation

protocol MemoRepository {
    func getMemos(completion: @escaping ([Memo]) -> Void)
    /// completion処理完了後に呼ばれる
    func saveMemo(memo: Memo, completion: @escaping () -> Void)
    /// completion処理完了後に呼ばれる
    func updateMemo(memo: Memo, completion: @escaping () -> Void)
    /// completion処理完了後に呼ばれる
    func removeMemo(id: String, completion: @escaping () -> Void)
}
