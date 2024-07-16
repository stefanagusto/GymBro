import SwiftUI

struct OneRepMaxView: View {
    @ObservedObject var viewModel: Epic2ViewModel
    
    var body: some View {
        VStack(spacing: 16) {
            HStack {
                Text("Your 1 Rep Max")
                    .font(.system(size: 24, weight: .bold))
                Spacer()
                Image(systemName: "figure.strengthtraining.traditional")
                    .font(.system(size: 24))
            }
            .padding(.horizontal)
            
            VStack(alignment: .center, spacing: 10) {
                HStack(spacing: 0) {
                    Text(viewModel.oneRepMax)
                        .font(.system(size: 60))
                        .foregroundColor(.gray)
                        .fontWeight(.bold)
                        .multilineTextAlignment(.trailing)
                    Text("Kg")
                        .font(.system(size: 24, weight: .bold))
                        .padding(.top, 25)
                        .padding(.trailing, 100)
                }
                Text("Please Input to show your 1RM")
                    .foregroundColor(.blue)
                    .font(.system(size: 11))
            }
            .padding()
            .background(Color.white)
            .cornerRadius(10)
            
            VStack(spacing: 0) {
                HStack {
                    Text("When Lifting")
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
                
                Divider()
                
                HStack {
                    Text("Till tired, I can do")
                        .foregroundColor(.black)
                    Spacer()
                    ZStack(alignment: .trailing) {
                        if viewModel.reps.isEmpty {
                            Text("reps")
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
            .background(Color.white)
            .cornerRadius(10)
        }
        .padding(.horizontal)
    }
}
