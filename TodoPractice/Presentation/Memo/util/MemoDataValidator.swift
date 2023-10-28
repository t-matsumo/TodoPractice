//
//  MemoDataValidator.swift
//  TodoPractice
//
//  Created by tatsuki_matsumoto on 2021/02/13.
//

import Foundation

enum MemoDataValidateError {
    case titleIsEmpty
    case titleIsOverLimit
    case contentIsOverLimit
}

class MemoDataValidator {
    func validate(title: String, content: String) -> [MemoDataValidateError] {
        var result: [MemoDataValidateError] = []
        
        if title.isEmpty {
            result.append(.titleIsEmpty)
        }
        
        if title.count > 50 {
            result.append(.titleIsOverLimit)
        }
        
        if content.count > 200 {
            result.append(.contentIsOverLimit)
        }
        
        return result
    }
}
