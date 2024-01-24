//
//  Item.swift
//  Group5_Store
//
//  Created by Alfie on 2024/1/21.
//

import Foundation

// class Item conforming IsPurchasable protocol
class Item: IsPurchasable {
    // stored properties
    var id: Int
    var title: String
    var price: Double

    // initializer
    init(id: Int, title: String, price: Double) {
        self.id = id
        self.title = title
        self.price = price
    }

    // computed property
    var info: String {
        return "Item Title: \(title), \n" +
               "Item Price: $\(price)"
    }

    // function for printing receipt
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
