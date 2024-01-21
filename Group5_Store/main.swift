//
//  main.swift
//  Group5_Store
//
//  Created by Alfie on 2024/1/21.
//

import Foundation

// Create items
let game1 = Game(id: 1, title: "Kingdom Rush Origins", price: 19.79, publisher: "Ironhide Game Studio", isMultiplayer: false)
let movie1 = Movie(id: 2, title: "The Spongebob Square Pants Movie", price: 6.69, runningTime: 98)
let game2 = Game(id: 3, title: "Heroes: Might and Magic", price: 54.99, publisher: "Ubisoft", isMultiplayer: true)

// Create store and add items
let store = Store()
store.items = [game1, movie1, game2]

// Create customer
let customer = Customer()

// Demonstrate basic functionality
store.findByTitle(keyword: "kingdom")  // Search for items with keyword "kingdom"

store.buyItem(customer: customer, itemId: 1)  // Try to purchase game1 without sufficient funds

customer.reloadAccount(amount: 20.0)  // Reload customer's account

store.buyItem(customer: customer, itemId: 1)  // Purchase game1 successfully

store.buyItem(customer: customer, itemId: 1)  // Try to purchase game1 again (should fail)

customer.useItem(id: 1, numMinutes: 40)  // Try to use game1 for more than 30 minutes

store.issueRefund(customer: customer, itemId: 1)  // Try to refund game1 (should fail)

customer.useItem(id: 2, numMinutes: 25)  // Use movie1 for less than 30 minutes

store.issueRefund(customer: customer, itemId: 2)  // Refund movie1 successfully

// Display customer's items and balance
print("\nCustomer's owned items:")
for ownedItem in customer.itemsList {
    print("\(ownedItem.item.title), Minutes Used: \(ownedItem.minutesUsed)")
}

print("\nCustomer's current balance: $\(customer.balance)")
