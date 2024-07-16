//
//  SegmentedControlView.swift
//  GymBro
//
//  Created by Stefan Agusto Hutapea on 16/07/24.
//

import SwiftUI


struct SegmentedControlView: View {
    @Binding var selectedSegment: Int
    var segments: [String]
    
    var body: some View {
        Picker("", selection: $selectedSegment) {
            ForEach(0..<segments.count) { index in
                Text(segments[index])
                    .tag(index)
            }
        }
        .pickerStyle(SegmentedPickerStyle())
        .padding(.horizontal)
    }
}


//#Preview {
//    SegmentedControlView()
//}
