//
//  OwnedItem.swift
//  Group5_Store
//
//  Created by Pabita on 2024/1/21.
//

import Foundation

// class OwnedItem inherits Item class
class OwnedItem : Item {
//    var item: Item
    var minutesUsed: Int

    init(id: Int, title: String, price: Double, minutesUsed: Int) {
        self.minutesUsed = minutesUsed
        super.init(id: id, title: title, price: price)
    }
}
