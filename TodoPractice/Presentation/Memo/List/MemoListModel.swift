//
//  MemoListModel.swift
//  TodoPractice
//
//  Created by tatsuki_matsumoto on 2021/02/11.
//

import Foundation

class MemoListModel {
    var memoCellDataArray: [MemoCellData] = []
    
    func numberOfRowsInSection() -> Int {
        self.memoCellDataArray.count
    }
}
