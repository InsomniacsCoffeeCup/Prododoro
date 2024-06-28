import SwiftUI
struct FinanceTips: View {
  @State private var searchText = ""
  @State private var selectedTab = 0
  var body: some View {
    NavigationView {
      ScrollView {
        VStack(alignment: .leading, spacing: 20) {
          Text("Financial Literacy")
            .font(.title)
            .fontWeight(.medium)
            .padding()
          HStack {
            Image(systemName: "magnifyingglass")
              .foregroundColor(.black)
            TextField("Search financial topics", text: $searchText)
          }
          .padding()
          .background((Color(hue: 0.735, saturation: 0.2, brightness: 0.947)))
          .cornerRadius(10)
          .padding(.horizontal)
          HStack {
            Text("Featured article 1")
              .font(.title3)
            Spacer()
            Link("Read More", destination: URL(string: "https://www.ft.com/")!)
              .font(.subheadline)
              .foregroundColor(Color(hue: 0.781, saturation: 0.321, brightness: 0.947))
          }
          .padding()
          HStack {
            Text("Featured article 2")
              .font(.title3)
            Spacer()
            Link("Read More", destination: URL(string: "https://www.investopedia.com/terms/s/student-debt.asp")!)
              .font(.subheadline)
              .foregroundColor(Color(hue: 0.781, saturation: 0.321, brightness: 0.947))
          }
          .padding()
        }
        .padding()
        VStack(alignment: .leading) {
          Text("Spending Habits Comparison")
            .font(.title3)
            .padding(.horizontal, 80)
          SpendingHabitsTableView()
            .padding(.top)
        }
        .padding(.vertical)
        .padding(.horizontal, -15)
      }
      Spacer()
    }
  }
}
struct SpendingHabitsTableView: View {
  var body: some View {
    VStack(alignment: .leading) {
      HStack {
        Text("Category")
          .font(.headline)
          .frame(width: 100, alignment: .leading)
        Spacer()
        Text("Your Spending")
          .font(.headline)
          .frame(width: 100, alignment: .leading)
        Spacer()
        Text("Average Spending")
          .font(.headline)
          .frame(width: 100, alignment: .leading)
      }
      .padding(.bottom, 5)
      ForEach(spendingData) { item in
        HStack {
          Text(item.category)
            .frame(width: 100, alignment: .leading)
          Spacer()
          Text("$\(item.yourSpending, specifier: "%.2f")")
            .frame(width: 100, alignment: .leading)
          Spacer()
          Text("$\(item.averageSpending, specifier: "%.2f")")
            .frame(width: 100, alignment: .leading)
        }
        .padding(.vertical)
      }
    }
    .padding()
    .padding(.horizontal, 28)
  }
}
struct SpendingItem: Identifiable {
  let id = UUID()
  let category: String
  let yourSpending: Double
  let averageSpending: Double
}
let spendingData = [
  SpendingItem(category: "Food", yourSpending: 300.00, averageSpending: 700.00),
  SpendingItem(category: "Transport", yourSpending: 1200.00, averageSpending: 1000.00),
  SpendingItem(category: "Self", yourSpending: 150.00, averageSpending: 200.00)
]
#Preview {
  FinanceTips()
}
