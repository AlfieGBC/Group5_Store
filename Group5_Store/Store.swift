//
//  Store.swift
//  Group5_Store
//
//  Created by Alfie on 2024/1/21.
//

import Foundation

class Store {
    var items: [Item] = []

    func buyItem(customer: Customer, itemId: Int) {
        guard let selectedItem = items.first(where: { $0.id == itemId }) else {
            print("Item not found in the store.")
            return
        }

        guard !customer.itemsList.contains(where: { $0.id == itemId }) else {
            print("You already own this item.")
            return
        }

        if customer.balance >= selectedItem.price {
            customer.balance -= selectedItem.price
            let ownedItem = OwnedItem(item: selectedItem)
            customer.itemsList.append(ownedItem)
            print("Purchase success!")
            selectedItem.printReceipt(isRefund: false, amount: selectedItem.price)
        } else {
            print("Purchase failed. Insufficient funds.")
        }
    }

    func issueRefund(customer: Customer, itemId: Int) {
        guard let ownedItemIndex = customer.itemsList.firstIndex(where: { $0.id == itemId }) else {
            print("Item not found in your list.")
            return
        }

        let ownedItem = customer.itemsList[ownedItemIndex]
        if ownedItem.minutesUsed < 30 {
            customer.balance += ownedItem.item.price
            customer.itemsList.remove(at: ownedItemIndex)
            print("Refund issued successfully.")
            ownedItem.item.printReceipt(isRefund: true, amount: ownedItem.item.price)
        } else {
            print("Refund failed. Item used for more than 30 minutes.")
        }
    }

    func findByTitle(keyword: String) {
        for item in items {
            if item.title.lowercased().contains(keyword.lowercased()) {
                print(item is Game ? "[GAME] \(item.info)" : "[MOVIE] \(item.info)")
            }
        }

        print("Sorry, no matching items found.")
    }
}
