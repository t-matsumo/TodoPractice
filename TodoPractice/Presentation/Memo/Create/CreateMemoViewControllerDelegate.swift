//
//  CreateMemoViewControllerDelegate.swift
//  TodoPractice
//
//  Created by tatsuki_matsumoto on 2021/02/13.
//

import Foundation

protocol CreateMemoViewControllerDelegate: class {
    func onTapCloseButton(sender: CreateMemoViewController)
    func didCreateMemo(sender: CreateMemoViewController)
}
