//
//  OneRMCalculatorModel.swift
//  GymBro
//
//  Created by Stefan Agusto Hutapea on 12/07/24.
//

import Foundation

struct OneRMCalculatorModel {
    static func calculate1RM(weight: Double, reps: Int) -> Double {
        return weight * (1 + Double(reps) / 30)
    }
}
