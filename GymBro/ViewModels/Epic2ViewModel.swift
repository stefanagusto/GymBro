import Foundation
import Combine

class Epic2ViewModel: ObservableObject {
    @Published var weight: String = ""
    @Published var reps: String = ""
    @Published var selectedSegment = 0
    @Published var result: Double?
    @Published var trainingWeights: [TrainingWeight] = []

    @Published var oneRepMax: String = ""
    private var cancellables = Set<AnyCancellable>()
    private let calculator = OneRepMaxCalculator()
    
    let segments = ["1 Rep Max", "Training Weight"]
    let percentages: [Double] = [100, 95, 90, 85, 80, 75, 70]
    let repetitions: [Double] = [1, 2, 4, 6, 8, 10, 12]
    
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
        self.result = result
        return String(format: "%.2f", result)
    }
    
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
