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
        .frame(width: 293)
        .cornerRadius(9.0)
        .pickerStyle(SegmentedPickerStyle())
        .padding(.horizontal)
    }
}
