import SwiftUI

struct OneRepMaxView: View {
    @ObservedObject var viewModel: TrainingWeightViewModel
    
    var body: some View {
        VStack(spacing: 14) {
            HStack {
                Image(systemName: "figure.strengthtraining.traditional")
                    .font(.system(size: 17))
                Text(LocalizedStringKey("Your 1 Rep Max"))
                    .font(.system(size: 17, weight: .bold))
                Spacer()
            }
            .padding(.horizontal)
            
            VStack(alignment: .center, spacing: 10) {
                HStack(spacing: 0) {
                    Text(viewModel.oneRepMax)
                        .font(.system(size: 60))
                        .foregroundColor(.blue)
                        .fontWeight(.bold)
                    Text("Kg")
                        .font(.system(size: 24, weight: .bold))
                        .padding(.top, 25)
                }
                if !viewModel.inputEntered {
                    Text(LocalizedStringKey("Please input to show your 1 RM"))
                        .foregroundColor(.gray)
                        .font(.system(size: 11))
                }
            }
            .frame(width: 330)
            .padding()
            .background(Color.bgRM)
            .cornerRadius(10)
            
            Divider()
            
            VStack(spacing: 0) {
                HStack {
                    Text(LocalizedStringKey("When Lifting"))
                        
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
                
                Divider()
                
                HStack {
                    Text(LocalizedStringKey("Till tired, i can do"))
                        
                    Spacer()
                    ZStack(alignment: .trailing) {
                        if viewModel.reps.isEmpty {
                            Text(LocalizedStringKey("Reps"))
                                .foregroundColor(.gray)
                        }
                        TextField("", text: $viewModel.reps)
                            .keyboardType(.numberPad)
                            .multilineTextAlignment(.trailing)
                            .frame(width: 60)
                            
                    }
                }
                .padding([.vertical], 8)
            }
            .padding(.horizontal)
            .background(Color.bgRM)
            .cornerRadius(10)
        }
        .padding(.horizontal)
    }
}
