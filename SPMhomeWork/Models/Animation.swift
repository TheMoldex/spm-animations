//
//  Model.swift
//  SPMhomeWork
//
//  Created by Денис Сташков on 8.11.2023.
//

import Foundation

struct Animation {
    let animation: String
    let curve: String
    let force: Double
    let duration: Double
    let delay: Double
    
    var description: String {
        """
preset: \(animation)\n
curve: \(curve)\n
force: \(force)\n
duration: \(duration)\n
delay: \(delay)\n
"""
    }
    
    static func getModel() -> [Animation] {
        var models: [Animation] = []
        let dataSource = DataSource.shared
        
        let animations = dataSource.animationList.randomElement()?.rawValue ?? "pop"
        let curves = dataSource.curves.randomElement()?.rawValue ?? "pop"
        
        let iterationCount = min(
            animations.count,
            curves.count
        )
        
        for _ in 0..<iterationCount {
            let model = Animation(
                animation: animations,
                curve: curves,
                force: getForceAndDuration().0,
                duration: getForceAndDuration().1,
                delay: 1
            )
            models.append(model)
        }
        func getForceAndDuration() -> (Double, Double){
            let randomForce = round(Double.random(in: 0.89...1.55) * 100) / 100
            let randomDuration = round(Double.random(in: 0.89...1.55) * 100) / 100
            return (randomForce,randomDuration)
        }
        return models
    }
}
