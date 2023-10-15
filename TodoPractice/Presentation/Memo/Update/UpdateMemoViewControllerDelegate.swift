//
//  UpdateMemoViewControllerDelegate.swift
//  TodoPractice
//
//  Created by tatsuki_matsumoto on 2021/02/13.
//

import Foundation

protocol UpdateMemoViewControllerDelegate: AnyObject {
    func onTapCloseButton(sender: UpdateMemoViewController)
    func didUpdateMemo(sender: UpdateMemoViewController)
    func didDeleteMemo(sender: UpdateMemoViewController)
}
