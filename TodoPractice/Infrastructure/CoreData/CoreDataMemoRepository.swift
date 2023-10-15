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
    
    func getMemos() async -> [Memo] {
        return await withCheckedContinuation { continuation in
            persistentContainer.performBackgroundTask { context -> Void in
                let request = MemoCoreDataEntity.fetchRequest()
                do {
                    let memos = try context.fetch(request)
                    continuation.resume(returning: memos.map { Memo(title: $0.title!, content: $0.content!, id: $0.id!) })
                } catch {
                    fatalError()
                }
            }
        }
    }
    
    func saveMemo(memo: Memo) async {
        await withCheckedContinuation { continuation in
            let context = persistentContainer.newBackgroundContext()
            
            let memoEntity = findMemoEntity(byId: memo.id, context: context) ?? NSEntityDescription.insertNewObject(forEntityName: "Memo", into: context) as! MemoCoreDataEntity
            memoEntity.id = memo.id
            memoEntity.title = memo.title
            memoEntity.content = memo.content
            
            persistentContainer.saveContext(backgroundContext: context)
            continuation.resume()
        }
    }
    
    func removeMemo(id: String) async {
        await withCheckedContinuation { continuation in
            let context = persistentContainer.newBackgroundContext()
            guard let entity = findMemoEntity(byId: id, context: context) else {
                continuation.resume()
                return
            }
            context.delete(entity)
            persistentContainer.saveContext(backgroundContext: context)
            continuation.resume()
        }
    }
}

private extension CoreDataMemoRepository {
    func findMemoEntity(
        byId id: String,
        context: NSManagedObjectContext
    ) -> MemoCoreDataEntity? {
        let request = MemoCoreDataEntity.fetchRequest()
        request.predicate = NSPredicate(format: "id == %@", id)
        do {
            return try context.fetch(request).first
        } catch {
            fatalError()
        }
    }
}
