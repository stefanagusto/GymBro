import SwiftUI

struct TrainingWeightView: View {
    @ObservedObject var viewModel: TrainingWeightViewModel
    
    var body: some View {
        VStack(spacing: 16) {
            HStack {
                Image(systemName: "figure.strengthtraining.traditional")
                    .font(.system(size: 22))
                Text("Your Training Weight")
                    .font(.system(size: 17, weight: .bold))
                Spacer()
            }
//            .padding(.horizontal)
            .padding(.trailing, 75)
            
            HStack {
                Text("1 RM")
                    
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
