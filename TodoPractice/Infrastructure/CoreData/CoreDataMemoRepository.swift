//
//  CoreDataMemoRepository.swift
//  TodoPractice
//
//  Created by tatsuki_matsumoto on 2023/10/15.
//

import Foundation
import CoreData

class CoreDataMemoRepository : MemoRepository {
    private let persistentContainer: PersistentContainer
    
    init(
        persistentContainer: PersistentContainer
    ) {
        self.persistentContainer = persistentContainer
        
//        let data = [
//            Memo(title: "ねる(つ∀-)ｵﾔｽﾐｰ", content: "何時にしよう？", id: UUID().uuidString),
//            Memo(title: "よるのおやつ(*´艸｀*)", content: "", id: UUID().uuidString),
//            Memo(title: "よるごはん(´～｀)ﾓｸﾞﾓｸﾞ", content: "ごはん！！", id: UUID().uuidString),
//            Memo(title: "おやつ(^_^)", content: "", id: UUID().uuidString),
//            Memo(title: "おひるね(。-ω-)zzz. . . (。ﾟωﾟ) ﾊｯ!", content: "", id: UUID().uuidString),
//            Memo(title: "ひるごはん！！", content: "何食べよう？", id: UUID().uuidString),
//            Memo(title: "朝ごはん((o(´∀｀)o))ﾜｸﾜｸ", content: "遅く起きたら昼ごはんと一緒", id: UUID().uuidString),
//            Memo(title: "起きる！！", content: "12時まででいいや", id: UUID().uuidString),
//        ]
//        for d in data {
//            saveMemo(memo: d) {}
//        }
    }
    
    func getMemos(completion: @escaping ([Memo]) -> Void) {
        let request = MemoCoreDataEntity.fetchRequest()
        do {
            let memos = try persistentContainer.viewContext.fetch(request)
            completion(memos.map { Memo(title: $0.title!, content: $0.content!, id: $0.id!) })
        } catch {
            fatalError()
        }
    }
    
    func saveMemo(memo: Memo, completion: @escaping () -> Void) {
        let memoEntity = findMemoEntity(byId: memo.id) ?? NSEntityDescription.insertNewObject(forEntityName: "Memo", into: persistentContainer.viewContext) as! MemoCoreDataEntity
        memoEntity.id = memo.id
        memoEntity.title = memo.title
        memoEntity.content = memo.content
        
        persistentContainer.saveContext()
        completion()
    }
    
    func updateMemo(memo: Memo, completion: @escaping () -> Void) {
        saveMemo(memo: memo, completion: completion)
    }
    
    func removeMemo(id: String, completion: @escaping () -> Void) {
        guard let entity = findMemoEntity(byId: id) else {
            completion()
            return
        }
        persistentContainer.viewContext.delete(entity)
        persistentContainer.saveContext()
        completion()
    }
}

private extension CoreDataMemoRepository {
    func findMemoEntity(byId id: String) -> MemoCoreDataEntity? {
        let request = MemoCoreDataEntity.fetchRequest()
        request.predicate = NSPredicate(format: "id == %@", id)
        do {
            return try persistentContainer.viewContext.fetch(request).first
        } catch {
            fatalError()
        }
    }
}
