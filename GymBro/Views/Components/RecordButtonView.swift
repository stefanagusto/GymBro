import SwiftUI

struct RecordButtonView: View {
    @EnvironmentObject var viewModel: TrainingWeightViewModel
    @Environment(\.modelContext) private var context
    
    var body: some View {
        Button(action: {
            if let resultValue = viewModel.result, let weightValue = Double(viewModel.weight), let repsValue = Int(viewModel.reps) {
                let newRecord = RecordModel(weight: weightValue, reps: repsValue, result: resultValue, date: Date())
                context.insert(newRecord)
            }
        }) {
            Text("Record Your Progress")
                .fontWeight(.semibold)
                .frame(maxWidth: .infinity)
                .padding()
                .background(Color.gray.opacity(0.2))
                .foregroundColor(viewModel.resultShow ? .blue : .gray.opacity(0.4))
                .cornerRadius(40)
        }
        .padding(.horizontal)
        .disabled(!viewModel.resultShow)
    }
}
