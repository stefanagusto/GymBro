import SwiftUI

struct HeaderView: View {
    var body: some View {
        Text("Weight Calculator")
            .font(.system(size: 34, weight: .bold))
            .padding(.top, 44)
            .padding(.trailing, 75)
            .multilineTextAlignment(.leading)
    }
}

#Preview {
    HeaderView()
}
