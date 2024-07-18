import SwiftUI

struct CalculateButtonView: View {
    var calculateAction: () -> Void
    @EnvironmentObject var viewModel: TrainingWeightViewModel
    
    var body: some View {
        Button(action: calculateAction) {
            Text("Calculate")
                .fontWeight(.semibold)
                .frame(maxWidth: .infinity)
                .padding()
                .background(Color.blue)
                .foregroundColor(.white)
                .cornerRadius(40)
        }
        .padding(.horizontal)
        
    }
}
