//
//  Item.swift
//  Group5_Store
//
//  Created by Alfie on 2024/1/21.
//

import Foundation

class Item: IsPurchasable {
    var id: Int
    var title: String
    var price: Double

    init(id: Int, title: String, price: Double) {
        self.id = id
        self.title = title
        self.price = price
    }

    var info: String {
        return "\(title) $\(price)"
    }

    func printReceipt(isRefund: Bool, amount: Double) {
        if isRefund {
            print("-------------------------")
            print("YOUR RECEIPT")
            print("-------------------------")
            print("We are refunding the purchase of \(title)")
            print("Refund amount: $\(amount)")
        } else {
            print("-------------------------")
            print("YOUR RECEIPT")
            print("-------------------------")
            print("Thank you for purchasing \(title)")
            print("Purchase amount: $\(amount)")
        }
    }
}
