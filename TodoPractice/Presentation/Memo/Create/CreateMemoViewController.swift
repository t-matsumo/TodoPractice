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
    
    private var saveMemoUseCase: SaveMemoUseCase!
    private let memoDataValidator = MemoDataValidator()
    override func viewDidLoad() {
        super.viewDidLoad()
    }
}

extension CreateMemoViewController {
    static func instantiate(
        delegate: CreateMemoViewControllerDelegate,
        saveMemoUseCase: SaveMemoUseCase
    ) -> UIViewController {
        let vcName = String(describing: self)
        let vc = UIStoryboard(name: vcName, bundle: nil).instantiateViewController(identifier: vcName) as! CreateMemoViewController
        vc.delegate = delegate
        vc.saveMemoUseCase = saveMemoUseCase
        return vc
    }
}

extension CreateMemoViewController {
    @IBAction private func onTapCreateButton(_ sender: Any) {
        let memoData = MemoData(title: self.titleField.text ?? "", content: self.contentField.text ?? "", id: UUID().uuidString)
        // TODO viewmodel作ったほうが良さそう？
        guard memoDataValidator.validate(memoData: memoData).isEmpty else {
            return
        }
        
        Task {
            await self.saveMemoUseCase.save(memoData: memoData)
            self.delegate?.didCreateMemo(sender: self)
        }
    }
    
    @IBAction private func onTapCancelButton(_ sender: Any) {
        self.delegate?.onTapCloseButton(sender: self)
    }
}
