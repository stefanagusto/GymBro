import SwiftUI

struct TrainingWeightTableView: View {
    var trainingWeights: [TrainingWeightModel]
    
    var body: some View {
        ForEach(trainingWeights, id: \.percentage) { weight in
            HStack(alignment: .top) {
                Text("\(String(format: "%.0f", weight.percentage))")
                Spacer()
                Text("\(String(format: "%.1f", weight.weight))")
                Spacer()
                Text("\(String(format: "%.0f", weight.reps))")
                    .padding(.trailing)
            }
            .padding([.horizontal, .vertical], 8)
            .font(.system(size: 14))
            Divider()
                .padding(.horizontal, 5)
        }
    }
}
