import SwiftUI

struct DisplayView: View {
    @EnvironmentObject private var viewModel: TrainingWeightViewModel
    
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
                BottomNavigationView()
            }
            .background(Color(UIColor.systemGray6).edgesIgnoringSafeArea(.all))
        }
    }
}

struct Epic2_Previews: PreviewProvider {
    static var previews: some View {
        DisplayView()
            .environmentObject(TrainingWeightViewModel())
    }
}
