import SwiftUI

struct OneRepMaxView: View {
    @ObservedObject var viewModel = OneRepMaxViewModel()
    
    var body: some View {
        VStack {
            Text("Calculator")
                .font(.largeTitle)
                .bold()
                .padding(.top, 20)
            
            Picker("Calculator Type", selection: $viewModel.segmentedControlSelection) {
                Text("1 Rep Max").tag(0)
                Text("Training Weight").tag(1)
            }
            .pickerStyle(SegmentedPickerStyle())
            .padding()
            
            if viewModel.segmentedControlSelection == 0 {
                VStack {
                    HStack {
                        Text("When Lifting")
                        Spacer()
                        TextField("kg", text: $viewModel.weight)
                            .keyboardType(.decimalPad)
                            .multilineTextAlignment(.trailing)
                            .frame(width: 80)
                            .textFieldStyle(RoundedBorderTextFieldStyle())
                    }
                    .padding()
                    
                    HStack {
                        Text("Till tired, I can do")
                        Spacer()
                        TextField("Reps", text: $viewModel.reps)
                            .keyboardType(.numberPad)
                            .multilineTextAlignment(.trailing)
                            .frame(width: 80)
                            .textFieldStyle(RoundedBorderTextFieldStyle())
                    }
                    .padding()
                    
                    Text("1RM: \(viewModel.oneRepMax)")
                        .font(.title2)
                        .bold()
                        .padding()
                }
                .padding()
            } else {
                // Training Weight View can go here
                Button(action: {
                    // Perform calculation if needed
                }) {
                    Text("Calculate")
                        .font(.title2)
                        .padding()
                        .frame(maxWidth: .infinity)
                        .background(Color.blue)
                        .foregroundColor(.white)
                        .cornerRadius(10)
                }
                .padding()
                
            }
            
            Spacer()
            
            // Add a tab bar if needed here
        }
        .padding()
        .background(Color.white)
        
    }
}

struct OneRepMaxView_Previews: PreviewProvider {
    static var previews: some View {
        OneRepMaxView()
    }
}
