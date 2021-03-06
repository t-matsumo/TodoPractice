//
//  MemoListViewController.swift
//  TodoPractice
//
//  Created by tatsuki_matsumoto on 2021/02/11.
//

import UIKit

class MemoListViewController: UIViewController {
    @IBOutlet private weak var tableView: UITableView!
    @IBOutlet private weak var addButton: UIButton!
    
    private let getMemoUseCase = GetMemoUseCase(memoRepository: InMemoryMemoRepository())
    private let memoListModel = MemoListModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupViews()
        loadMemos()
    }
    
    @IBAction private func onTapAddButton(_ sender: Any) {
        let vc = CreateMemoViewController.instantiate(delegate: self)
        present(vc, animated: true, completion: nil)
    }
}

extension MemoListViewController : UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let memo = self.memoListModel.memoCellDataArray[indexPath.row]
        let memoData = MemoData(title: memo.title, content: memo.content, id: memo.id)
        let vc = UpdateMemoViewController.instantiate(memoData: memoData, delegate: self)
        present(vc, animated: true, completion: nil)
        tableView.deselectRow(at: indexPath, animated: true)
    }
}

extension MemoListViewController : UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        self.memoListModel.numberOfRowsInSection()
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: MemoCell.reuseId, for: indexPath) as! MemoCell
        let memo = self.memoListModel.memoCellDataArray[indexPath.row]
        cell.setUpWith(memoCellData: memo)
        return cell
    }
}

extension MemoListViewController : CreateMemoViewControllerDelegate {
    func onTapCloseButton(sender: CreateMemoViewController) {
        sender.dismiss(animated: true, completion: nil)
    }
    
    func didCreateMemo(sender: CreateMemoViewController) {
        loadMemos()
        sender.dismiss(animated: true, completion: nil)
    }
}

extension MemoListViewController : UpdateMemoViewControllerDelegate {
    func onTapCloseButton(sender: UpdateMemoViewController) {
        sender.dismiss(animated: true, completion: nil)
    }
    
    func didUpdateMemo(sender: UpdateMemoViewController) {
        loadMemos()
        sender.dismiss(animated: true, completion: nil)
    }
    
    func didDeleteMemo(sender: UpdateMemoViewController) {
        loadMemos()
        sender.dismiss(animated: true, completion: nil)
    }
}
extension MemoListViewController {
    private func setupViews() {
        self.tableView.delegate = self
        self.tableView.dataSource = self
        self.tableView.register(UINib(nibName: "MemoCell", bundle: nil), forCellReuseIdentifier: MemoCell.reuseId)
        
        addButton.layer.borderColor = UIColor.systemBlue.cgColor
        addButton.layer.borderWidth = 2.0
    }
    
    private func loadMemos() {
        self.getMemoUseCase.getMemos(completion: { [weak self](memoDataList) in
            // TODO:ViewModelの中でやるべきでは？
            self?.memoListModel.memoCellDataArray = memoDataList.map(MemoCellData.init)
            self?.tableView.reloadData()
        })
    }
}
