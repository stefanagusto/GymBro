//
//  CalculateButtonView.swift
//  GymBro
//
//  Created by Stefan Agusto Hutapea on 16/07/24.
//

import SwiftUI

struct CalculateButtonView: View {
    var calculateAction: () -> Void
    
    var body: some View {
        Button(action: calculateAction) {
            Text("Calculate")
                .frame(maxWidth: .infinity)
                .padding()
                .background(Color.blue)
                .foregroundColor(.white)
                .cornerRadius(40)
        }
        .padding(.horizontal)
    }
}

//#Preview {
//    CalculateButtonView()
//}
