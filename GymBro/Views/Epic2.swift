import SwiftUI

struct Epic2: View {
    @EnvironmentObject private var viewModel: Epic2ViewModel
    
    var body: some View {
        NavigationStack {
            VStack(spacing: 20) {
                HeaderView()
                SegmentedControlView(selectedSegment: $viewModel.selectedSegment, segments: viewModel.segments)
                if viewModel.selectedSegment == 0 {
                    OneRepMaxView(viewModel: viewModel)
                } else {
                    TrainingWeightView(viewModel: viewModel)
                }
                CalculateButtonView(calculateAction: viewModel.calculate)
                Divider()
                if let result = viewModel.result {
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
        Epic2()
            .environmentObject(Epic2ViewModel())
    }
}
