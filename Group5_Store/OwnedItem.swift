//
//  OwnedItem.swift
//  Group5_Store
//
//  Created by Alfie on 2024/1/21.
//

import Foundation

class OwnedItem {
    var item: Item
    var minutesUsed: Int

    init(item: Item) {
        self.item = item
        self.minutesUsed = 0
    }
}
