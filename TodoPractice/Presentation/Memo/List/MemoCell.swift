//
//  MemoCell.swift
//  TodoPractice
//
//  Created by tatsuki_matsumoto on 2021/02/13.
//

import UIKit

class MemoCell: UITableViewCell {
    static let reuseId = "UITableViewCell"
    
    @IBOutlet private weak var title: UILabel!
    @IBOutlet private weak var content: UILabel!
    
    func setUpWith(memoCellData: MemoCellData) {
        self.title.text = memoCellData.title
        self.content.text = memoCellData.content
        
        self.updateConstraintsIfNeeded()
    }
}
