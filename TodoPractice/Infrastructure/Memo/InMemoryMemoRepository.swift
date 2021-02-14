//
//  InMemoryMemoRepository.swift
//  TodoPractice
//
//  Created by tatsuki_matsumoto on 2021/02/11.
//

import Foundation

class InMemoryMemoRepository : MemoRepository {
    private static let dataAccessQueue = DispatchQueue(label: "dataAccessQueue")
//    private static var database = (1...40).compactMap { n in InMemoryMemoEntity(title: "title\(n)", content: "content\(n)") }
//    private static var database:[InMemoryMemoEntity] = []
    private static var database = [
        InMemoryMemoEntity(title: "ねる(つ∀-)ｵﾔｽﾐｰ", content: "何時にしよう？"),
        InMemoryMemoEntity(title: "よるのおやつ(*´艸｀*)", content: ""),
        InMemoryMemoEntity(title: "よるごはん(´～｀)ﾓｸﾞﾓｸﾞ", content: "ごはん！！"),
        InMemoryMemoEntity(title: "おやつ(^_^)", content: ""),
        InMemoryMemoEntity(title: "おひるね(。-ω-)zzz. . . (。ﾟωﾟ) ﾊｯ!", content: ""),
        InMemoryMemoEntity(title: "ひるごはん！！", content: "何食べよう？"),
        InMemoryMemoEntity(title: "朝ごはん((o(´∀｀)o))ﾜｸﾜｸ", content: "遅く起きたら昼ごはんと一緒"),
        InMemoryMemoEntity(title: "起きる！！", content: "12時まででいいや"),
    ]
    
    func getMemos(completion: @escaping ([Memo]) -> Void) {
        InMemoryMemoRepository.dataAccessQueue.async {
            sleep(1)
            let memos: [Memo] = InMemoryMemoRepository.database.compactMap(MemoFactoryForInMemoryEntity.create).reversed()
            DispatchQueue.main.async {
                completion(memos)
            }
        }
    }
    
    func saveMemo(memo: Memo, completion: @escaping () -> Void) {
        InMemoryMemoRepository.dataAccessQueue.async {
            sleep(1)
            InMemoryMemoRepository.database.append(InMemoryMemoEntity(memo: memo))
            DispatchQueue.main.async {
                completion()
            }
        }
    }
    
    func updateMemo(memo: Memo, completion: @escaping () -> Void) {
        InMemoryMemoRepository.dataAccessQueue.async {
            sleep(1)
            let index = InMemoryMemoRepository.database.firstIndex { entity -> Bool in
                entity.id == memo.id
            }
            if let index = index {
                InMemoryMemoRepository.database[index] = InMemoryMemoEntity(memo: memo)
            }
            DispatchQueue.main.async {
                completion()
            }
        }
    }
    
    func removeMemo(id: String, completion: @escaping () -> Void) {
        InMemoryMemoRepository.dataAccessQueue.async {
            sleep(1)
            InMemoryMemoRepository.database.removeAll { $0.id == id }
            DispatchQueue.main.async {
                completion()
            }
        }
    }
}
