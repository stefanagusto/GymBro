import Foundation
import SwiftData

@Model
class RecordModel {
    var weight: Double
    var reps: Int
    var result: Double
    var date: Date
    
    init(weight: Double, reps: Int, result: Double, date: Date) {
        self.weight = weight
        self.reps = reps
        self.result = result
        self.date = date
    }
    
    var formattedDate: String {
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy/MM/dd HH:mm"
        return formatter.string(from: date)
    }
}
