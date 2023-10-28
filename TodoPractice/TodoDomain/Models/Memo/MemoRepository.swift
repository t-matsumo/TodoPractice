//
//  MemoRepository.swift
//  TodoPractice
//
//  Created by tatsuki_matsumoto on 2021/02/11.
//

import Foundation

protocol MemoRepository {
    func getAll() async -> [Memo]
    func find(byId id: String) async -> Memo?
    func save(_ target: Memo) async throws
    func remove(byId id: String) async throws
}
