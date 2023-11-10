//
//  DataSource.swift
//  SPMhomeWork
//
//  Created by Денис Сташков on 8.11.2023.
//

import Foundation
import SpringAnimation

final class DataSource {
    static let shared = DataSource()
    
    let animationList = AnimationPreset.allCases
    let curves = AnimationCurve.allCases
    
    private init() {}
}
