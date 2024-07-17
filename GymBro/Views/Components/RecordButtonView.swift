//
//  RecordButtonView.swift
//  GymBro
//
//  Created by Benedick Wijayaputra on 17/07/24.
//

import SwiftUI

struct RecordButtonView: View {
    @EnvironmentObject var viewModel: TrainingWeightViewModel
    var body: some View {
        
        Button(action: {
                            // Your button action here
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

//#Preview {
//    RecordButtonView()
//}
