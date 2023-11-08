//
//  Model.swift
//  SPMhomeWork
//
//  Created by Денис Сташков on 8.11.2023.
//

import Foundation

struct Model {
    let animation: String
    let curve: String
    let force: Double
    let duration: Double
    let buttonlabel: String
    
    static func getModel() -> [Model] {
        var models: [Model] = []
        let dataSource = DataSource.shared
        
        let animations = dataSource.animationList
        let curves = dataSource.curves.shuffled()
        
        let iterationCount = min(
            animations.count,
            curves.count
        )
        
        for index in 0..<iterationCount {
            let model = Model(
                animation: animations[index],
                curve: curves[index],
                force: getForceAndDuration().0,
                duration: getForceAndDuration().1,
                buttonlabel: animations[index]
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
