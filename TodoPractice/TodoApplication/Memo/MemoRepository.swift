//
//  MemoRepository.swift
//  TodoPractice
//
//  Created by tatsuki_matsumoto on 2021/02/11.
//

import Foundation

protocol MemoId {
    func value() -> String
}

protocol MemoRepository {
    func createId() -> MemoId
    func getAll() async -> [Memo]
    func find(by id: MemoId) async -> Memo?
    func save(_ target: Memo) async throws
    func remove(_ target: Memo) async throws
}
