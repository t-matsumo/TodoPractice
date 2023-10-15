//
//  CreateMemoViewControllerDelegate.swift
//  TodoPractice
//
//  Created by tatsuki_matsumoto on 2021/02/13.
//

import Foundation

protocol CreateMemoViewControllerDelegate: AnyObject {
    func onTapCloseButton(sender: CreateMemoViewController)
    func didCreateMemo(sender: CreateMemoViewController)
}
