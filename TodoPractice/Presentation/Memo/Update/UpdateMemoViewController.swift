//
//  UpdateMemoViewController.swift
//  TodoPractice
//
//  Created by tatsuki_matsumoto on 2021/02/13.
//

import UIKit

class UpdateMemoViewController: UIViewController {
    @IBOutlet private weak var titleField: UITextField!
    @IBOutlet private weak var contentField: UITextField!
    
    private weak var delegate: UpdateMemoViewControllerDelegate?
    private var viewModel: UpdateMemoViewModel!
    
    private let updateMemoUseCase = UpdateMemoUseCase(repository: InMemoryMemoRepository())
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupViews()
    }
}

extension UpdateMemoViewController {
    static func instantiate(memoData: MemoData, delegate: UpdateMemoViewControllerDelegate) -> UIViewController {
        let vcName = String(describing: self)
        let vc = UIStoryboard(name: vcName, bundle: nil).instantiateViewController(identifier: vcName) as! UpdateMemoViewController
        vc.delegate = delegate
        vc.viewModel = UpdateMemoViewModel(memoData: memoData)
        return vc
    }
}

extension UpdateMemoViewController {
    private func setupViews() {
        self.titleField.text = self.viewModel.title
        self.contentField.text = self.viewModel.content
    }
}

extension UpdateMemoViewController {
    @IBAction func onTapCloseButton(_ sender: Any) {
        self.delegate?.onTapCloseButton(sender: self)
    }
    
    @IBAction func onTapUpdateButton(_ sender: Any) {
        let memoData = MemoData(title: self.titleField.text!, content: self.contentField.text!, id: self.viewModel.id)
        self.updateMemoUseCase.update(memoData: memoData) { errors in
            if (errors.isEmpty) {
                self.delegate?.didUpdateMemo(sender: self)
            }
        }
    }
}
