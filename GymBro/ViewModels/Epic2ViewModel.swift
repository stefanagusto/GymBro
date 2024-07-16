//
//  Epic2ViewModel.swift
//  cobacoba
//
//  Created by Benedick Wijayaputra on 16/07/24.
//

import SwiftUI

class Epic2ViewModel: ObservableObject {
    @Published var weight: String = ""
    @Published var selectedSegment = 0
    @Published var result: Double?
    @Published var trainingWeights: [TrainingWeight] = []
    
    let segments = ["1 Rep Max", "Training Weight"]
//    let percentages: [Double] = [100, 95, 90, 85, 80, 75, 70, 65, 60, 55, 50]
    let percentages: [Double] = [100, 95, 90, 85, 80, 75, 70]
//    let repetitions: [Double] = [1, 2, 4, 6, 8, 10, 12, 16, 20, 24, 30]
    let repetitions: [Double] = [1, 2, 4, 6, 8, 10, 12]
    
    func calculate() {
        guard let weightValue = Double(weight) else {
            result = nil
            return
        }
        if selectedSegment == 0 {
            result = weightValue
        } else {
            result = weightValue * (36 / (37 - 1)) // Assuming 1 RM for training weight
        }
        
        trainingWeights = percentages.enumerated().map { (index, percentage) in
            let liftWeight = result! * (percentage / 100)
            let reps = repetitions[index]
            return TrainingWeight(percentage: percentage, weight: liftWeight, reps: reps)
        }
    }
}
