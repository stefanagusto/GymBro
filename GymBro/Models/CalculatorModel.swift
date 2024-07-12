//
//  CalculatorModel.swift
//  GymBro
//
//  Created by Stefan Agusto Hutapea on 12/07/24.
//

import Foundation

struct CalculatorModel {
    static func calculate1RM(weight: Double, reps: Int) -> Double {
            if reps <= 8 {
                // Brzycki formula: 1RM = w * (36 / (37 - r))
                return weight * (36 / (37 - Double(reps)))
            } else {
                // Epley formula: 1RM = w * (1 + r / 30)
                return weight * (1 + Double(reps) / 30)
            }
        }
    }
