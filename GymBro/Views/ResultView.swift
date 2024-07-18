import SwiftUI

struct ResultView: View {
    var result: Double
    var trainingWeights: [TrainingWeightModel]
    
    var body: some View {
        VStack(alignment: .leading) {
            HStack {
                Text("%")
                    .font(.system(size: 14, weight: .bold))
                    .foregroundStyle(.blue)
                Spacer()
                Text("Weight (kg)")
                    .font(.system(size: 14, weight: .bold))
                    .foregroundStyle(.blue)
                Spacer()
                Text("Reps")
                    .font(.system(size: 14, weight: .bold))
                    .foregroundStyle(.blue)
            }
            .padding([.top, .horizontal])
            
            Divider()
            
            ScrollView {
                TrainingWeightTableView(trainingWeights: trainingWeights)
            }
            .frame(height: 200)
        }
        .background(Color.bgRM)
        .cornerRadius(10)
        .padding()
    }
}
