import Foundation

struct OneRepMaxCalculatorViewModel {
    // Function to calculate 1RM using Epley's formula
    func calculateOneRepMax(weight: Double, reps: Int) -> Double {
        if reps <= 8 {
            // Brzycki formula: 1RM = w * (36 / (37 - r))
            return weight * (36 / (37 - Double(reps)))
        } else {
            // Epley formula: 1RM = w * (1 + r / 30)
            return weight * (1 + Double(reps) / 30)
        }
    }
}
