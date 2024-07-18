//
//  DisplayView.swift
//  GymBro
//
//  Created by Benedick Wijayaputra on 17/07/24.
//

import SwiftUI
import SwiftData

struct DisplayView: View {
    @EnvironmentObject var viewModel: TrainingWeightViewModel
    @Environment(\.modelContext) private var context

    var body: some View {
        NavigationStack {
            VStack(spacing: 20) {
                HeaderView()
                SegmentedControlView(selectedSegment: $viewModel.selectedSegment, segments: viewModel.segments)
                if viewModel.selectedSegment == 0 {
                    OneRepMaxView(viewModel: viewModel)
                    CalculateButtonView(calculateAction: viewModel.calculate)
                    
                    RecordButtonView()
                } else {
                    TrainingWeightView(viewModel: viewModel)
                    CalculateButtonView(calculateAction: viewModel.calculate)
                }

                if viewModel.selectedSegment == 1, let result = viewModel.result {
                    ResultView(result: result, trainingWeights: viewModel.trainingWeights)
                }
                Divider()
                Spacer()
            }

            .background(Color.bgApp.edgesIgnoringSafeArea(.all))

        }
    }
}
