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

                Divider()

                if viewModel.selectedSegment == 1, let result = viewModel.result {
                    ResultView(result: result, trainingWeights: viewModel.trainingWeights)
                }
                Spacer()
            }
            .background(Color(UIColor.systemGray6).edgesIgnoringSafeArea(.all))
            .environment(\.modelContext, context) // Pass the context to child views
        }
    }
}
