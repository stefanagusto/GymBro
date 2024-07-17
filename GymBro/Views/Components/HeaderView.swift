//
//  HeaderView.swift
//  GymBro
//
//  Created by Stefan Agusto Hutapea on 16/07/24.
//

import SwiftUI

struct HeaderView: View {
    var body: some View {
        Text(LocalizedStringKey("Weight Calculator"))
            .font(.system(size: 34, weight: .bold))
            .padding(.top, 40)
            .padding(.trailing, 50)
            .multilineTextAlignment(.leading)
    }
}

#Preview {
    HeaderView()
}
