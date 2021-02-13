//
//  CreateMemoViewController.swift
//  TodoPractice
//
//  Created by tatsuki_matsumoto on 2021/02/13.
//

import UIKit

class CreateMemoViewController: UIViewController {
    @IBOutlet private weak var titleField: UITextField!
    @IBOutlet private weak var contentField: UITextField!
    
    private weak var delegate: CreateMemoViewControllerDelegate?
    
    private let saveMemoUseCase = SaveMemoUseCase(repository: InMemoryMemoRepository())
}

extension CreateMemoViewController {
    static func instantiate(delegate: CreateMemoViewControllerDelegate) -> UIViewController {
        let vcName = String(describing: self)
        let vc = UIStoryboard(name: vcName, bundle: nil).instantiateViewController(identifier: vcName) as! CreateMemoViewController
        vc.delegate = delegate
        return vc
    }
}

extension CreateMemoViewController {
    @IBAction private func onTapCreateButton(_ sender: Any) {
        let memoData = MemoData(title: self.titleField.text ?? "", content: self.contentField.text ?? "")
        self.saveMemoUseCase.save(memoData: memoData) { errors in
            if (errors.isEmpty) {
                self.delegate?.didCreateMemo(sender: self)
            }
        }
    }
    
    @IBAction private func onTapCancelButton(_ sender: Any) {
        self.delegate?.onTapCloseButton(sender: self)
    }
}
