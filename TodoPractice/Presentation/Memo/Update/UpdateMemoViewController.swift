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
        repository: MemoRepository
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
        guard memoDataValidator.validate(
            title: self.titleField.text!,
            content: self.contentField.text!
        ).isEmpty else {
            return
        }
        
        Task {
            let request = UpdateMemoUseCaseRequest(
                title: memoData.title,
                content: memoData.content,
                id: memoData.id
            )
            do {
                try await self.updateMemoUseCase.execute(request)
            } catch {
                print("更新失敗！！！！") // というような表示にしたい
                return
            }
            self.delegate?.didUpdateMemo(sender: self)
        }
    }
    
    @IBAction func onTapDeleteButton(_ sender: Any) {
        Task {
            do {
                try await self.removeMemoUseCase.execute(by: self.viewModel.id)
            } catch {
                print("削除失敗！！！！") // というような表示にしたい
                return
            }
            self.delegate?.didDeleteMemo(sender: self)
        }
    }
}
