//
//  Customer.swift
//  Group5_Store
//
//  Created by Alfie on 2024/1/21.
//
//  Check Requirements:
//  1. Customer class with itemsList, balance, reloadAccount(amount), and useItem(id, minutes) methods.
//



import Foundation

class Customer {
    var itemsList: [OwnedItem] = []
    var balance: Double = 10.0

    func reloadAccount(amount: Double) {
        balance += amount
        print("Account reloaded with $\(amount). New balance: $\(balance)")
    }

    func useItem(id: Int, numMinutes: Int) {
        if let ownedItem = itemsList.first(where: { $0.id == id }) {
            ownedItem.minutesUsed += numMinutes
            print("Used \(ownedItem.title) for \(numMinutes) minutes. Total minutes used: \(ownedItem.minutesUsed)")
        } else {
            print("Item with ID \(id) not found in your items list.")
        }
    }
}
