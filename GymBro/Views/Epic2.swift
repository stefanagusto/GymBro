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
                Text("Weight Calculator")
                    .font(.system(size: 34, weight: .bold))
                    .padding(.top, 40)
                
                Picker("", selection: $viewModel.selectedSegment) {
                    ForEach(0..<viewModel.segments.count) { index in
                        Text(viewModel.segments[index])
                            .tag(index)
                    }
                }
                .pickerStyle(SegmentedPickerStyle())
                .padding(.horizontal)
                
                Group {
                    if viewModel.selectedSegment == 0 {
                        VStack(spacing: 16) {
                            HStack {
                                Text("Your 1 Rep Max")
                                    .font(.system(size: 24, weight: .bold))
                                Spacer()
                                Image(systemName: "figure.strengthtraining.traditional")
                                    .font(.system(size: 24))
                            }
                            .padding(.horizontal)
                            
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
                    } else {
                        VStack(spacing: 16) {
                            HStack {
                                Text("Your Training Weight")
                                    .font(.system(size: 24, weight: .bold))
                                Spacer()
                                Image(systemName: "figure.strengthtraining.traditional")
                                    .font(.system(size: 24))
                            }
                            .padding(.horizontal)
                            
                            HStack {
                                Text("1RM")
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
                            .padding(.horizontal)
                            .background(Color.white)
                            .cornerRadius(10)
                        }
                        .padding(.horizontal)
                    }
                }
                
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
                        Text("Record")
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
