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
    
    private var updateMemoUseCase: UpdateMemoUseCase!
    private var removeMemoUseCase: RemoveMemoUseCase!
    private let memoDataValidator = MemoDataValidator()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupViews()
    }
}

extension UpdateMemoViewController {
    static func instantiate(
        memoData: MemoData,
        delegate: UpdateMemoViewControllerDelegate,
        repository: MemoRepository = InMemoryMemoRepository()
    ) -> UIViewController {
        let vcName = String(describing: self)
        let vc = UIStoryboard(name: vcName, bundle: nil).instantiateViewController(identifier: vcName) as! UpdateMemoViewController
        vc.delegate = delegate
        vc.viewModel = UpdateMemoViewModel(memoData: memoData)
        vc.updateMemoUseCase = UpdateMemoUseCase(repository: repository)
        vc.removeMemoUseCase = RemoveMemoUseCase(repository: repository)
        
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
        // TODO viewmodel作ったほうが良さそう？
        guard memoDataValidator.validate(memoData: memoData).isEmpty else {
            return
        }
        
        self.updateMemoUseCase.update(memoData: memoData) {
            self.delegate?.didUpdateMemo(sender: self)
            
        }
    }
    
    @IBAction func onTapDeleteButton(_ sender: Any) {
        self.removeMemoUseCase.remove(id: self.viewModel.id) { [weak self] in
            guard let self = self else {
                return
            }
            self.delegate?.didDeleteMemo(sender: self)
        }
    }
}
