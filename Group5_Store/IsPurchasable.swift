//
//  IsPurchasable.swift
//  Group5_Store
//
//  Created by Alfie on 2024/1/21.
//

import Foundation

protocol IsPurchasable {
    var info: String { get }
    func printReceipt(isRefund: Bool, amount: Double)
}
