//
//  Animation.swift
//  SpringAnimations
//
//  Created by Tatiana Lazarenko on 3/12/24.
//

import Foundation
import SpringAnimation

struct Animation {
    let preset: String
    let curve: String
    let force: Double
    let duration: Double
    let delay: Double
    
    static func getAnimation() -> Animation {
        let titles = TitlesStore.shared
        let curves = CurvesStore.shared
        
        let animation = Animation(
            preset: titles.titles.randomElement() ?? "pop",
            curve: curves.curves.randomElement() ?? "easeIn",
            force: Double.random(in: 1.0...2.0),
            duration: Double.random(in: 0.5...3.0),
            delay: Double.random(in: 0.0...0.8)
        )
        
        return animation
    }
}
