//
//  TrainingWeightView.swift
//  GymBro
//
//  Created by Stefan Agusto Hutapea on 16/07/24.
//

import SwiftUI

struct TrainingWeightView: View {
    @ObservedObject var viewModel: Epic2ViewModel
    
    var body: some View {
        VStack(spacing: 16) {
            HStack {
                Text("Your Training Weight")
                    .font(.system(size: 24, weight: .bold))
                Spacer()
                Image(systemName: "figure.strengthtraining.traditional")
                    .font(.system(size: 24))
            }
            .padding(.horizontal)
            
            HStack {
                Text("1RM")
                    .foregroundColor(.black)
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
            .background(Color.white)
            .cornerRadius(10)
        }
        .padding(.horizontal)
    }
}

//#Preview {
//    TrainingWeightView()
//}
