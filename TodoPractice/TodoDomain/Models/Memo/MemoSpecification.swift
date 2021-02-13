//
//  MemoSpecification.swift
//  TodoPractice
//
//  Created by tatsuki_matsumoto on 2021/02/13.
//

import Foundation

enum MemoSpecificationValidateError {
    case titleIsEmpty
    case titleIsOverLimit
    case contentIsOverLimit
}

class MemoSpecification {
    func validate(memoData: MemoData) -> [MemoSpecificationValidateError] {
        var result: [MemoSpecificationValidateError] = []
        
        if memoData.title.isEmpty {
            result.append(.titleIsEmpty)
        }
        
        if memoData.title.count > 50 {
            result.append(.titleIsOverLimit)
        }
        
        if memoData.content.count > 200 {
            result.append(.contentIsOverLimit)
        }
        
        return result
    }
}
