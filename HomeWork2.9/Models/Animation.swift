//
//  Animation.swift
//  HomeWork2.9
//
//  Created by Admin on 25.02.2021.
//

import Foundation

struct Animation {
    var title: String!
    var curve: String!
    var duration: Float!
    var force: Float!
    var delay: Float!
}

extension Animation {
    static func getAnimation() -> Animation {
        let anima = Animation(
            title: "",
            curve: "",
            duration: Float.random(in: 1..<2),
            force: Float.random(in: 0.1..<1),
            delay: Float.random(in: 0.1..<1.5)
        )
        return anima
    }
    
}



