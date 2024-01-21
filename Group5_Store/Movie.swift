//
//  Movie.swift
//  Group5_Store
//
//  Created by Alfie on 2024/1/21.
//

import Foundation

class Movie: Item {
    var runningTime: Int

    init(id: Int, title: String, price: Double, runningTime: Int) {
        self.runningTime = runningTime
        super.init(id: id, title: title, price: price)
    }

    override var info: String {
        return "\(super.info)\nRunning Time: \(runningTime) min"
    }
}
