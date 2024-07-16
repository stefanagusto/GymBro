//
//  Epic2ViewModel.swift
//  cobacoba
//
//  Created by Benedick Wijayaputra on 16/07/24.
//

import SwiftUI

class Epic2ViewModel: ObservableObject {
    @Published var weight: String = ""
    @Published var reps: String = ""
    @Published var selectedSegment = 0
    @Published var result: Double?
    @Published var trainingWeights: [TrainingWeight] = []
    
    let segments = ["1 Rep Max", "Training Weight"]
    let percentages: [Double] = [100, 95, 90, 85, 80, 75, 70]
    let repetitions: [Double] = [1, 2, 4, 6, 8, 10, 12]
    
    func calculate() {
        guard let weightValue = Double(weight) else {
            result = nil
            return
        }
        
        if selectedSegment == 0 {
            guard let repsValue = Double(reps) else {
                result = nil
                return
            }
            result = weightValue * (36 / (37 - repsValue))
        } else {
            result = weightValue
        }
        
        trainingWeights = percentages.enumerated().map { (index, percentage) in
            let liftWeight = result! * (percentage / 100)
            let reps = repetitions[index]
            return TrainingWeight(percentage: percentage, weight: liftWeight, reps: reps)
        }
    }
}
