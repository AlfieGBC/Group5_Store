//
//  Game.swift
//  Group5_Store
//
//  Created by Pabita on 2024/1/21.
//

import Foundation

//class Game inherits Item class
class Game: Item {
    // stored Properties
    var publisher: String
    var isMultiplayer: Bool

    init(id: Int, title: String, price: Double, publisher: String, isMultiplayer: Bool) {
        self.publisher = publisher
        self.isMultiplayer = isMultiplayer
        super.init(id: id, title: title, price: price)
    }

    // info property overrides the parent’s implementation of the property
    override var info: String {
        return "\(super.info)\nPublisher: \(publisher)\nIs Multiplayer: \(isMultiplayer)"
    }
}
