import SwiftUI
import SwiftData

struct RecordProgressionView: View {
    @Environment(\.modelContext) private var context
    @Query(sort: \RecordModel.date) private var records: [RecordModel]
    
    var body: some View {
        NavigationStack {
            VStack{
                HeaderViewRecord()
                List {
                    ForEach(records) { record in
                        ExpenseCell(record: record)
                    }
                    .onDelete { indexSet in
                        for index in indexSet {
                            context.delete(records[index])
                        }
                    }
                }
                .overlay {
                    if records.isEmpty {
                        ContentUnavailableView(label: {
                            Label("No Records", systemImage: "list.bullet.rectangle.portrait")
                        }, description: {
                            Text("There is no Record Available")
                        })
                    }
                }
            }
            .background(Color(.bgApp).edgesIgnoringSafeArea(.all))
        }
    }
}

struct ExpenseCell: View {
    let record: RecordModel
    
    var body: some View {
        VStack(alignment: .leading, spacing: 15) {
            Text(record.formattedDate)
                .font(.system(size: 15))
                .foregroundColor(.gray)
            
            HStack(spacing: 100) {
                RoundedRectangle(cornerRadius: 30)
                    .foregroundColor(.blue)
                    .frame(width: 95, height: 40)
                    .overlay {
                        Text("\(record.result, specifier: "%.1f")kg")
                            .font(.system(size: 22, weight: .bold))
                            .foregroundColor(.white)
                    }
                
                HStack(spacing: 24){
                    VStack {
                        Text("Weight")
                            .font(.system(size: 17))
                            .foregroundStyle(Color.gray)
                        Text("\(record.weight, specifier: "%.1f")")
                            .font(.system(size: 17, weight: .semibold))
                    }
                    VStack {
                        Text("Reps")
                            .font(.system(size: 17))
                            .foregroundStyle(Color.gray)
                        Text("\(record.reps)")
                            .font(.system(size: 17, weight: .semibold))
                    }
                }
                
            }
        }
    }
}
