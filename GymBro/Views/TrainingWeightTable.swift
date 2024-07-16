//
//  TrainingWeightTable.swift
//  GymBro
//
//  Created by Stefan Agusto Hutapea on 16/07/24.
//

import SwiftUI

struct TrainingWeightTable: View {
    var trainingWeights: [TrainingWeight]
    
    var body: some View {
        ForEach(trainingWeights, id: \.percentage) { weight in
            HStack {
                Text("\(String(format: "%.1f", weight.percentage))%")
                Spacer()
                Text("\(String(format: "%.1f", weight.weight)) kg")
                Spacer()
                Text("\(String(format: "%.0f", weight.reps))")
            }
            .padding([.horizontal, .vertical], 8)
            .font(.system(size: 14))
            Divider()
                .padding(.horizontal, 5)
        }
    }
}

//#Preview {
//    TrainingWeightTable()
//}
