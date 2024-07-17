//
//  BottomNavigationView.swift
//  GymBro
//
//  Created by Stefan Agusto Hutapea on 16/07/24.
//

import SwiftUI

struct BottomNavigationView: View {
    var body: some View {
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
        .background(Color.bgApp)
        .cornerRadius(20)
        .padding(.horizontal)
    }
}

//#Preview {
//    BottomNavigationView()
//}
