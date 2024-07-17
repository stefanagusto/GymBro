//
//  ResultView.swift
//  GymBro
//
//  Created by Stefan Agusto Hutapea on 16/07/24.
//

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
                Text(LocalizedStringKey("Weight (kg)"))
                    .font(.system(size: 14, weight: .bold))
                    .foregroundStyle(.blue)
                Spacer()
                Text(LocalizedStringKey("Reps"))
                    .font(.system(size: 14, weight: .bold))
                    .foregroundStyle(.blue)
            }
            .padding([.top, .horizontal])
            
            Divider()
            
            ScrollView {
                TrainingWeightTableView(trainingWeights: trainingWeights)
            }
            .frame(maxHeight: 500) // Set a max height for the scroll view
        }
        .background(Color.bgRM)
        .cornerRadius(10)
        .padding()
    }
}
//#Preview {
//    ResultView()
//}
