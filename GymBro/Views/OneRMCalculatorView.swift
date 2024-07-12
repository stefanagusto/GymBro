//
//  OneRMCalculatorView.swift
//  GymBro
//
//  Created by Stefan Agusto Hutapea on 12/07/24.
//

import SwiftUI

struct OneRMCalculatorView: View {
    @StateObject private var viewModel = OneRMCalculatorViewModel()

    var body: some View {
        NavigationView {
            VStack(spacing: 20) {
                Text("1RM Calculator")
                    .font(.largeTitle)
                    .fontWeight(.bold)

                TextField("Weight Lifted (kg)", text: $viewModel.weightLifted)
                    .keyboardType(.decimalPad)
                    .padding()
                    .background(Color(.systemGray6))
                    .cornerRadius(8)

                TextField("Number of Reps", text: $viewModel.numberOfReps)
                    .keyboardType(.numberPad)
                    .padding()
                    .background(Color(.systemGray6))
                    .cornerRadius(8)

                Button(action: viewModel.calculate1RM) {
                    Text("Calculate 1RM")
                        .foregroundColor(.white)
                        .padding()
                        .frame(maxWidth: .infinity)
                        .background(Color.blue)
                        .cornerRadius(8)
                }

                if let oneRM = viewModel.oneRM {
                    Text("Estimated 1RM: \(String(format: "%.2f", oneRM)) kg")
                        .font(.title2)
                        .padding()
                }

                Spacer()
            }
            .padding()
        }
    }
}

struct OneRMCalculatorView_Previews: PreviewProvider {
    static var previews: some View {
        OneRMCalculatorView()
    }
}
