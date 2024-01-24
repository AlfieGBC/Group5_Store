//
//  main.swift
//  Group5_Store
//
//  Created by Alfie on 2024/1/21.
//

import Foundation

// Demonstration of basic functionality

print("=== Initialize data ===\n")

print("Create a store and add movie and game items")
let store = Store()
let movie1 = Movie(id: 1, title: "The Spongebob Square Pants Movie", price: 6.69, runningTime: 98)
let movie2 = Movie(id: 2, title: "Another Movie", price: 9.99, runningTime: 120)
let game1 = Game(id: 3, title: "Kingdom Rush Origins", price: 19.79, publisher: "Ironhide Game Studio", isMultiplayer: false)
let game2 = Game(id: 4, title: "Another Game", price: 29.99, publisher: "Game Studio", isMultiplayer: true)
store.items = [movie1, movie2, game1, game2]

print("Creating a customer")
let customer = Customer()

print("\n=== 1. Test search feature ===")
print("\n1-1. Scenario: Searching for an existing item")
store.findByTitle(keyword: "Spongebob")

print("\n1-2. Scenario: Searching for a non-existing item")
store.findByTitle(keyword: "Nonexistent")

print("\n=== 2. Test purchase functionality ===")
print("Current gift card balance: $\(customer.balance)")

print("\n2-1. Scenario: Attempting to purchase an unaffordable item")
store.buyItem(customer: customer, itemId: 4)

print("\n2-2. Scenario: Attempting to purchase an affordable item")
store.buyItem(customer: customer, itemId: 1)

print("\n2-3. Scenario: Reloading the gift card and attempting to purchase previously unaffordable item")
customer.reloadAccount(amount: 30.0)
store.buyItem(customer: customer, itemId: 4)

print("\n2-4. Scenario: Attempting to purchase the same item again")
store.buyItem(customer: customer, itemId: 1)

print("\n=== Customer Current Information ===")
print("\n1. Current Balance: $\(customer.balance)")
print("\n2. Owned Items:")
customer.itemsList.forEach { item in
    print("- \(item.info)")
}

print("\n=== 3. Test refund functionality ===")

print("\n3-1. Scenario: Attempting to refund an item used for more than 30 minutes")
customer.useItem(id: 1, numMinutes: 40)
store.issueRefund(customer: customer, itemId: 1)

print("\n3-2. Scenario: Attempting to refund an unused item")
store.issueRefund(customer: customer, itemId: 2)

print("\n3-2. Scenario: Attempting to refund an unused item")
store.issueRefund(customer: customer, itemId: 4)

print("\n=== Customer Current Information ===")
print("\n1. Current Balance: $\(customer.balance)")
print("\n2. Owned Items:")
customer.itemsList.forEach { item in
    print("- \(item.info)")
}
