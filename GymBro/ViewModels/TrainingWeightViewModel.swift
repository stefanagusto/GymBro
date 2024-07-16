import Foundation
import Combine

class TrainingWeightViewModel: ObservableObject {
    @Published var weight: String = ""
    @Published var reps: String = ""
    @Published var selectedSegment = 0
    @Published var result: Double?
    @Published var trainingWeights: [TrainingWeightModel] = []
    @Published var oneRepMax: String = "0"
    @Published var inputEntered: Bool = false

    private var cancellables = Set<AnyCancellable>()
    private let calculator = OneRepMaxCalculatorViewModel()
    
    let segments = ["1 Rep Max", "Training Weight"]
    let percentages: [Double] = [100, 95, 90, 85, 80, 75, 70]
    let repetitions: [Double] = [1, 2, 4, 6, 8, 10, 12]
    
    private func calculateOneRepMax(weight: String, reps: String) -> String {
        guard let weight = Double(weight), let reps = Int(reps), reps > 0 else {
            return "0"
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
        
        inputEntered = true
        
        if selectedSegment == 0 {
            oneRepMax = calculateOneRepMax(weight: weight, reps: reps)
        } else {
            result = weightValue
            trainingWeights = percentages.enumerated().map { (index, percentage) in
                let liftWeight = result! * (percentage / 100)
                let reps = repetitions[index]
                return TrainingWeightModel(percentage: percentage, weight: liftWeight, reps: reps)
            }
        }
    }
}
