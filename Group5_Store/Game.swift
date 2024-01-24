//
//  Game.swift
//  Group5_Store
//
//  Created by Alfie on 2024/1/21.
//

import Foundation

// The game class represents a video game that is sold in the store.
// class Game inherits Item class
class Game: Item {
    // stored property
    var publisher: String
    var isMultiplayer: Bool

    init(id: Int, title: String, price: Double, publisher: String, isMultiplayer: Bool) {
        self.publisher = publisher
        self.isMultiplayer = isMultiplayer
        super.init(id: id, title: title, price: price)
    }

    // overrides the parent implementation
    override var info: String {
        return "\(super.info)\nPublisher: \(publisher)\nIs Multiplayer: \(isMultiplayer)"
    }
}
