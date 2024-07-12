//
//  OneRMCalculatorViewModel.swift
//  GymBro
//
//  Created by Stefan Agusto Hutapea on 12/07/24.
//

import Foundation

import Foundation

class OneRMCalculatorViewModel: ObservableObject {
    @Published var weightLifted: String = ""
        @Published var numberOfReps: String = ""
        @Published var oneRM: Double?

        func calculate1RM() {
            guard let weight = Double(weightLifted), let reps = Int(numberOfReps) else {
                oneRM = nil
                return
            }

            oneRM = CalculatorModel.calculate1RM(weight: weight, reps: reps)
        }
    }
