//
//  Game.swift
//  Group5_Store
//
//  Created by Alfie on 2024/1/21.
//

import Foundation

class Game: Item {
    var publisher: String
    var isMultiplayer: Bool

    init(id: Int, title: String, price: Double, publisher: String, isMultiplayer: Bool) {
        self.publisher = publisher
        self.isMultiplayer = isMultiplayer
        super.init(id: id, title: title, price: price)
    }

    override var info: String {
        return "\(super.info)\nPublisher: \(publisher)\nIs Multiplayer: \(isMultiplayer)"
    }
}
