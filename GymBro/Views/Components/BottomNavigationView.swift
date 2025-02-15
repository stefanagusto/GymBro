import SwiftUI

struct BottomNavigationView: View {
    @EnvironmentObject var viewModel: TrainingWeightViewModel
    @State private var selectedTab = 0

    var body: some View {
        TabView(selection: $selectedTab) {
            DisplayView()
                .tabItem {
                    Image(systemName: "dumbbell.fill")
                        .font(.system(size: 24))
                    Text("Calculator")
                        .font(.system(size: 14))
                }
                .tag(0)

            RecordProgressionView()
                .tabItem {
                    Image(systemName: "list.bullet.rectangle.portrait")
                        .font(.system(size: 24))
                    Text("Record")
                        .font(.system(size: 14))
                }
                .tag(1)
        }
    }
}
