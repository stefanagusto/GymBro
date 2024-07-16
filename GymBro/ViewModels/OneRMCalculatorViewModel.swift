//
//  OneRMCalculatorViewModel.swift
//  GymBro
//
//  Created by Stefan Agusto Hutapea on 12/07/24.
//

import Foundation
import Combine

class OneRepMaxViewModel: ObservableObject {
    @Published var weight: String = ""
    @Published var reps: String = ""
    @Published var oneRepMax: String = ""
    @Published var segmentedControlSelection: Int = 0 // 0 for 1RM, 1 for Training Weight

    private var cancellables = Set<AnyCancellable>()
    private let calculator = OneRepMaxCalculator()
    
    init() {
        $weight
            .combineLatest($reps)
            .map { weight, reps in
                self.calculateOneRepMax(weight: weight, reps: reps)
            }
            .assign(to: \.oneRepMax, on: self)
            .store(in: &cancellables)
    }
    
    private func calculateOneRepMax(weight: String, reps: String) -> String {
        guard let weight = Double(weight), let reps = Int(reps), reps > 0 else {
            return "Invalid input"
        }
        let result = calculator.calculateOneRepMax(weight: weight, reps: reps)
        return String(format: "%.2f kg", result)
    }
}
