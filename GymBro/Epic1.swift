//
//  Epic1.swift
//  GymBro
//
//  Created by Theresia Angela Ayrin on 15/07/24.
//

import SwiftUI

struct Epic1: View {
    @State private var weight: String = ""
    @State private var reps: String = ""
    @State private var result: Double?
    @State private var formula: String = ""

    var body: some View {
        VStack {
            
            Text("Epic 1")
                .font(.title)
            
            TextField("Weight", text: $weight)
                .padding()
                .keyboardType(.numberPad)
                .border(Color.gray, width: 1)
            
            TextField("Reps", text: $reps)
                .padding()
                .keyboardType(.numberPad)
                .border(Color.gray, width: 1)
            
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
                Text("Formula = \(formula)")
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
        if (reps2 <= 8){
            result = weight2 * (36/(37-reps2))
            print(weight2)
            print(reps2)
            print(result!)
            formula = "Brzycki Formula"
            print("Brzycki Formula")
        }
        else if (reps2 > 8){
            result = weight2 * (1 + (reps2 / 30))
            print(weight2)
            print(reps2)
            print(result!)
            formula = "Epley Formula"
            print("Epley Formula")
        }
    }
}

#Preview {
    Epic1()
}
