//
//  MemoListViewController.swift
//  TodoPractice
//
//  Created by tatsuki_matsumoto on 2021/02/11.
//

import UIKit

class MemoListViewController: UIViewController {
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var addButton: UIButton!
    
    let getMemoUseCase = GetMemoUseCase(memoRepository: InMemoryMemoRepository())
    let memoListModel = MemoListModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupViews()
        
        self.getMemoUseCase.getMemos(completion: { [weak self](memoDataList) in
            // Modelの中でやるべきでは？
            self?.memoListModel.memoCellDataArray = memoDataList.map(MemoCellData.init)
            DispatchQueue.main.async { [weak self] in
                self?.tableView.reloadData()
            }
        })
    }
    
    func setupViews() {
        self.tableView.delegate = self
        self.tableView.dataSource = self
        self.tableView.register(UINib(nibName: "MemoCell", bundle: nil), forCellReuseIdentifier: MemoCell.reuseId)
        
        addButton.layer.borderColor = UIColor.systemBlue.cgColor
        addButton.layer.borderWidth = 2.0
    }
}

extension MemoListViewController : UITableViewDelegate {
    
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
