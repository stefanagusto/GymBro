//
//  HeaderViewRecord.swift
//  GymBro
//
//  Created by Benedick Wijayaputra on 17/07/24.
//

import SwiftUI

struct HeaderViewRecord: View {
    var body: some View {
        Text("Progression Record")
            .font(.system(size: 34, weight: .bold))
            .padding(.top, 44)
            .padding(.trailing, 75)
            .multilineTextAlignment(.leading)
        
        
        Divider()
    }
}

#Preview {
    HeaderViewRecord()
}
