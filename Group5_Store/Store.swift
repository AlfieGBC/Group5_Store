//
//  Store.swift
//  Group5_Store
//
//  Created by Yan on 2024/1/21.
//

import Foundation

class Store {
    var items: [Item] = []
    
    func buyItem(customer: Customer, itemId: Int) {
        
        // Check if the item is in stock
        guard let selectedItem = items.first(where: { $0.id == itemId }) else {
            print("Item not found in the store.")
            return
        }


        // Check if the item already owned by the customer
        guard !customer.itemsList.contains(where: { $0.id == itemId }) else {
            print("You already own this item.")
            return
        }

        // Check if the customer has enough money in balance
        if customer.balance >= selectedItem.price {
            
            // Price deducted from the balance
            customer.balance -= selectedItem.price
            
            // Item added to the customer's ownedItem list
            let ownedItem = OwnedItem(id: selectedItem.id, title: selectedItem.title, price: selectedItem.price, minutesUsed: 0)
            customer.itemsList.append(ownedItem)
            print("Purchase success!")
            
            // Print purchase receipt
            selectedItem.printReceipt(isRefund: false, amount: selectedItem.price)
        } else {
            print("Purchase failed. Insufficient funds.")
        }
    }

    func issueRefund(customer: Customer, itemId: Int) {
        
        // Check if the item is owned by the customer
        guard let ownedItemIndex = customer.itemsList.firstIndex(where: { $0.id == itemId }) else {
            print("Item not found in your list.")
            return
        }

        let ownedItem = customer.itemsList[ownedItemIndex]
        
        // Check if used for less than 30 minutes
        // If so, issue refund
        // If not, error message
        if ownedItem.minutesUsed < 30 {
            
            // Increase the customer balance
            customer.balance += ownedItem.price
            
            // Remove the item from the ownedItems List
            customer.itemsList.remove(at: ownedItemIndex)
            print("Refund issued successfully.")
            
            // Print refund receipt
            ownedItem.printReceipt(isRefund: true, amount: ownedItem.price)
        } else {
            print("Refund failed. Item used for more than 30 minutes.")
        }
    }

    func findByTitle(keyword: String) {
        for item in items {
            if item.title.lowercased().contains(keyword.lowercased()) {
                print(item is Game ? "[GAME] \(item.info)" : "[MOVIE] \(item.info)")
                return
            }
        }

        print("Sorry, no matching items found.")
    }
}
