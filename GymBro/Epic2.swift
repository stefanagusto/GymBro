//
//  Epic2.swift
//  GymBro
//
//  Created by Theresia Angela Ayrin on 15/07/24.
//

import SwiftUI

struct Epic2: View {
    @State private var weight: String = ""
    @State private var reps: String = "1"
    @State private var result: Double?
    @State private var formula: String = ""

    // Define percentages and lift weights based on 1RM
    let percentages: [Double] = [100, 95, 90, 85, 80, 75, 70, 65, 60, 55, 50]
    let repetitions: [Double] = [1, 2, 4, 6, 8, 10, 12, 16, 20, 24, 30]
    
    var body: some View {
        VStack {
            
            Text("Epic 2")
                .font(.title)
            
            TextField("Weight", text: $weight)
                .padding()
                .keyboardType(.numberPad)
                .border(Color.gray, width: 1)
            
            TextField("Reps", text: $reps)
                .padding()
                .keyboardType(.numberPad)
                .border(Color.gray, width: 1)
                .disabled(true)
                .foregroundColor(.gray)
            
            Button("Calculate") {
                calculate()
            }
            .font(.headline)
            .padding()
            .background(Color.blue)
            .foregroundColor(.white)
            .cornerRadius(10)
            .padding()
            
            if let result = result {
                Text("Your one rep max (1RM) = \(String(format: "%.1f", result)) kg")
                    .padding()
                
                // Print percentage table
                VStack(alignment: .leading, spacing: 10) {
//                    Text("Percentage of 1RM")
//                        .fontWeight(.bold)
//                        .padding(.bottom, 5)
                    
                    HStack {
                        Text("Percentage")
                            .fontWeight(.bold)
                            .frame(width: 120, alignment: .center)
                            .font(.caption)
                        
//                        Divider()
                        
                        Text("Lift Weight")
                            .fontWeight(.bold)
                            .frame(width: 120, alignment: .center)
                            .font(.caption)
                        
//                        Divider()
                        
                        Text("Repetitions of 1 RM")
                            .fontWeight(.bold)
                            .frame(width: 120, alignment: .center)
                            .font(.caption)
                    }
                    .padding(.horizontal, 5)
                    
//                    ScrollView {
                        ForEach(percentages.indices, id: \.self) { index in
                            let percentage = percentages[index]
                            let repetition = repetitions[index]
                            let liftWeight = result * (percentage / 100)
                            
                            HStack {
                                Text("\(String(format: "%.1f", percentage))%")
                                    .frame(width: 120, alignment: .center)
                                    .font(.body)
                                
    //                            Divider()
                                
                                Text("\(String(format: "%.1f", liftWeight)) kg")
                                    .frame(width: 120, alignment: .center)
                                    .font(.body)
                                
    //                            Divider()
                                
                                Text("\(String(format: "%.0f", repetition))")
                                    .frame(width: 120, alignment: .center)
                                    .font(.body)
                                
                            }
                            Divider()
                            .padding(.horizontal, 5)
                        }
//                    }
                }
                .padding()
            } else {
                Text("")
                    .padding()
            }
        }
        .padding()
    }
    
    func calculate() {
        guard let weight2 = Double(weight),
              let reps2 = Double(reps)
        else {
            result = nil
            return
        }
        result = weight2 * (36/(37-reps2))
    }
}
    
#Preview{
    Epic2()
}
