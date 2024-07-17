//
//  TrainingWeightView.swift
//  GymBro
//
//  Created by Stefan Agusto Hutapea on 16/07/24.
//

import SwiftUI

struct TrainingWeightView: View {
    @ObservedObject var viewModel: TrainingWeightViewModel
    
    var body: some View {
        VStack(spacing: 16) {
            HStack {
                Image(systemName: "figure.strengthtraining.traditional")
                    .font(.system(size: 17))
                Text(LocalizedStringKey("Your Training Weight"))
                    .font(.system(size: 17, weight: .bold))
                Spacer()
            }
            .padding(.horizontal)
            
            HStack {
                Text(LocalizedStringKey("1 Rep Max"))
                    
                Spacer()
                ZStack(alignment: .trailing) {
                    if viewModel.weight.isEmpty {
                        Text("kg")
                            .foregroundColor(.gray)
                    }
                    TextField("", text: $viewModel.weight)
                        .keyboardType(.decimalPad)
                        .multilineTextAlignment(.trailing)
                        .frame(width: 60)
                }
            }
            .padding([.vertical], 8)
            .padding(.horizontal)
            .background(Color.bgRM)
            .cornerRadius(10)
        }
        .padding(.horizontal)
    }
}

//#Preview {
//    TrainingWeightView()
//}
