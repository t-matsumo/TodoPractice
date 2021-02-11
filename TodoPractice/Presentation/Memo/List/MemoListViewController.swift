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
        
        DispatchQueue.global().async { [weak self] in
            guard let self = self else {
                return
            }
            
            self.memoListModel.memoDataArray = self.getMemoUseCase.getMemos().map(MemoData.init)
            DispatchQueue.main.async { [weak self] in
                self?.tableView.reloadData()
            }
        }
        
        self.tableView.delegate = self
        self.tableView.dataSource = self
        
        addButton.layer.borderColor = UIColor.systemBlue.cgColor
        addButton.layer.borderWidth = 2.0
    }
}

extension MemoListViewController : UITableViewDelegate {
    
}

extension MemoListViewController : UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        self.memoListModel.memoDataArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell") ?? UITableViewCell.init(style: .subtitle, reuseIdentifier: "Cell")
        let memo = self.memoListModel.memoDataArray[indexPath.row]
        cell.textLabel?.text = memo.title
        cell.detailTextLabel?.text = memo.content
        return cell
    }
}
