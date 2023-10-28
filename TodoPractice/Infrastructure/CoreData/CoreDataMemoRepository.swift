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
    
    func getAll() async -> [Memo] {
        return await withCheckedContinuation { continuation in
            persistentContainer.performBackgroundTask { context -> Void in
                let request = MemoCoreDataEntity.fetchRequest()
                let memos: [MemoCoreDataEntity]
                do {
                    memos = try context.fetch(request)
                } catch {
                    assertionFailure()
                    memos = []
                }
                continuation.resume(returning: memos.map { Memo(title: $0.title!, content: $0.content!, id: $0.id!) })
            }
        }
    }
    
    func find(byId id: String) async -> Memo? {
        await withCheckedContinuation { continuation in
            persistentContainer.performBackgroundTask { context -> Void in
                let memo = self.find(byId: id, context: context)
                continuation.resume(returning: memo.map { Memo(title: $0.title!, content: $0.content!, id: $0.id!) })
            }
        }
    }
    
    func save(_ target: Memo) async throws {
        try await withCheckedThrowingContinuation { continuation in
            persistentContainer.performBackgroundTask { context -> Void in
                guard let memoEntity = self.find(byId: target.id, context: context) ?? NSEntityDescription.insertNewObject(forEntityName: "Memo", into: context) as? MemoCoreDataEntity else {
                    assertionFailure()
                    continuation.resume()
                    return
                }
                
                memoEntity.id = target.id
                memoEntity.title = target.title
                memoEntity.content = target.content
                
                do {
                    try self.persistentContainer.saveContext(backgroundContext: context)
                } catch {
                    continuation.resume(throwing: error)
                    return
                }
                continuation.resume()
            }
        }
    }
    
    func remove(byId id: String) async throws {
        try await withCheckedThrowingContinuation { continuation in
            persistentContainer.performBackgroundTask { context -> Void in
                guard let entity = self.find(byId: id, context: context) else {
                    continuation.resume()
                    return
                }
                context.delete(entity)
                
                do {
                    try self.persistentContainer.saveContext(backgroundContext: context)
                } catch {
                    continuation.resume(throwing: error)
                    return
                }
                continuation.resume()
            }
        }
    }
}

private extension CoreDataMemoRepository {
    func find(
        byId id: String,
        context: NSManagedObjectContext
    ) -> MemoCoreDataEntity? {
        let request = MemoCoreDataEntity.fetchRequest()
        request.predicate = NSPredicate(format: "id == %@", id)
        do {
            return try context.fetch(request).first
        } catch {
            assertionFailure()
            return nil
        }
    }
}
