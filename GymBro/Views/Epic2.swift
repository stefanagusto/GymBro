//
//  Epic2.swift
//  cobacoba
//
//  Created by Benedick Wijayaputra on 16/07/24.
//

import SwiftUI

struct Epic2: View {
    @StateObject private var viewModel = Epic2ViewModel()
    
    var body: some View {
        NavigationStack {
            VStack(spacing: 20) {
                Text("Estimate Your")
                    .font(.system(size: 34, weight: .bold))
                    .padding(.trailing, 140)
                    .padding(.top, 40)
                
                Picker("", selection: $viewModel.selectedSegment) {
                    ForEach(0..<viewModel.segments.count) { index in
                        Text(viewModel.segments[index])
                            .tag(index)
                    }
                }
                .frame(width: 293, height:  28)
                .pickerStyle(SegmentedPickerStyle())
                .padding(.horizontal)
                .cornerRadius(9)
                
                HStack {
                    TextField(viewModel.selectedSegment == 0 ? "When Lifting" : "1RM", text: $viewModel.weight)
                        .frame(height: 44)
                        .keyboardType(.decimalPad)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                        .cornerRadius(10)
                    Text("kg")
                        .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                        .padding(.leading, 5)
                }
                .padding(.horizontal)
                
                Button(action: {
                    viewModel.calculate()
                }) {
                    Text("Calculate")
                        .frame(maxWidth: .infinity)
                        .padding()
                        .background(Color.blue)
                        .foregroundColor(.white)
                        .cornerRadius(40)
                }
                .padding(.horizontal)
                
                Divider()
                
                if let result = viewModel.result {
                    VStack(alignment: .leading) {
                        HStack {
                            Text("Your Training Weight")
                                .font(.system(size: 24, weight: .bold))
                            Spacer()
                            Image(systemName: "figure.strengthtraining.traditional")
                                .font(.system(size: 24))
                        }
                        .padding([.top, .horizontal])
                        
                        HStack {
                            Text("%")
                                .font(.system(size: 14, weight: .bold))
                                .foregroundStyle(.blue)
                            Spacer()
                            Text("Weight (kg)")
                                .font(.system(size: 14, weight: .bold))
                                .foregroundStyle(.blue)
                            Spacer()
                            Text("Reps")
                                .font(.system(size: 14, weight: .bold))
                                .foregroundStyle(.blue)
                        }
                        .padding([.top, .horizontal])
                        
                        Divider()
                        
                        ScrollView {
                            TrainingWeightTable(trainingWeights: viewModel.trainingWeights)
                        }
                        .frame(maxHeight: 500) // Set a max height for the scroll view
                    }
                    .background(Color.white)
                    .cornerRadius(10)
                    .shadow(radius: 5)
                    .padding()
                }
                
                Spacer()
                
                HStack {
                    Spacer()
                    VStack {
                        Image(systemName: "dumbbell.fill")
                            .font(.system(size: 24))
                        Text("Calculator")
                            .font(.system(size: 14))
                    }
                    .foregroundColor(.blue)
                    Spacer()
                    VStack {
                        Image(systemName: "list.bullet.rectangle.portrait")
                            .font(.system(size: 24))
                        Text("Planning")
                            .font(.system(size: 14))
                    }
                    Spacer()
                }
                .padding()
                .background(Color(UIColor.systemGray6))
                .cornerRadius(20)
                .padding(.horizontal)
            }
            .background(Color(UIColor.systemGray6).edgesIgnoringSafeArea(.all))
        }
    }
}

struct TrainingWeightTable: View {
    var trainingWeights: [TrainingWeight]
    
    var body: some View {
            ForEach(trainingWeights, id: \.percentage) { weight in
                HStack {
                    Text("\(String(format: "%.1f", weight.percentage))%")
                    Spacer()
                    Text("\(String(format: "%.1f", weight.weight)) kg")
                    Spacer()
                    Text("\(String(format: "%.0f", weight.reps))")
                }
                .padding([.horizontal, .vertical], 8)
                .font(.system(size: 14))
                Divider()
                    .padding(.horizontal, 5)
            }
    }
}

struct Epic2_Previews: PreviewProvider {
    static var previews: some View {
        Epic2()
    }
}
