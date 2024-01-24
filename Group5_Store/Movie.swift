//
//  Movie.swift
//  Group5_Store
//
//  Created by Pabita on 2024/1/21.
//

import Foundation

// class Movie inherits Item class
class Movie: Item {
    // stored property
    var runningTime: Int

    init(id: Int, title: String, price: Double, runningTime: Int) {
        self.runningTime = runningTime
        super.init(id: id, title: title, price: price)
    }

    // info property overrides the parent’s implementation of the property
    override var info: String {
        return "\(super.info)\nRunning Time: \(runningTime) min"
    }
}
