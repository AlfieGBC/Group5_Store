//
//  Customer.swift
//  Group5_Store
//
//  Created by Alfie on 2024/1/21.
//

import Foundation

class Customer {
    var itemsList: [OwnedItem] = []
    var balance: Double = 10.0

    func reloadAccount(amount: Double) {
        balance += amount
        print("Reloaded account with $\(amount). New balance: $\(balance)")
    }

    func useItem(id: Int, numMinutes: Int) {
        if let ownedItem = itemsList.first(where: { $0.item.id == id }) {
            ownedItem.minutesUsed += numMinutes
            print("Used \(ownedItem.item.title) for \(numMinutes) minutes. Total minutes used: \(ownedItem.minutesUsed)")
        } else {
            print("Item not found in your list.")
        }
    }
}
