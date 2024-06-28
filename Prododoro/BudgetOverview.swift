import SwiftUI
struct BudgetOverview: View {
  //state variables to hold budget values
  @State private var income: Double = 0
  @State private var expenses: Double = 0
  @State private var savings: Double = 0
  //state variables for progress tracking
  @State private var foodSpent: Double = 0
  @State private var foodBudget: Double = 0
  @State private var transportSpent: Double = 0
  @State private var transportBudget: Double = 0
  @State private var selfSpent: Double = 0
  @State private var selfBudget: Double = 0
  @State var percent: CGFloat = 0
  @Environment(\.presentationMode) var presentationMode
  func calculatePercentage(spent: Double, budget: Double) -> CGFloat {
    if budget == 0 {
      return 0
    }
    return CGFloat((spent / budget) * 100)
  }
  var body: some View {
    ScrollView {
    VStack(alignment: .leading) {
      Text("Budget Overview")
        .font(.title)
        .fontWeight(.medium)
        .padding()
      HStack {
        Text("Income:")
        TextField("Income", value: $income, formatter: NumberFormatter())
          .textFieldStyle(RoundedBorderTextFieldStyle())
          .keyboardType(.decimalPad)
        Text("Expenses:")
        TextField("Expenses", value: $expenses, formatter: NumberFormatter())
          .textFieldStyle(RoundedBorderTextFieldStyle())
          .keyboardType(.decimalPad)
      }
      .padding()
      Spacer()
      HStack {
        Text("Savings:")
        TextField("Savings", value: $savings, formatter: NumberFormatter())
          .textFieldStyle(RoundedBorderTextFieldStyle())
          .keyboardType(.decimalPad)
      }
      .padding()
      Spacer()
      Text("Progress!!")
        .font(.title)
        .fontWeight(.medium)
        .padding()
      //progress bars
      VStack(alignment: .leading) {
        Text("Food")
        ProgressBars(width: 200, height: 20, percent: calculatePercentage(spent: foodSpent, budget: foodBudget))
        HStack {
          Text("Spent:")
          TextField("Food Spent", value: $foodSpent, formatter: NumberFormatter())
            .textFieldStyle(RoundedBorderTextFieldStyle())
            .keyboardType(.decimalPad)
          Text("Budget")
          TextField("Food Budget", value: $foodBudget, formatter: NumberFormatter())
            .textFieldStyle(RoundedBorderTextFieldStyle())
            .keyboardType(.decimalPad)
        }
      }
      .padding()
      VStack(alignment: .leading) {
        Text("Transport")
        ProgressBars(width: 200, height: 20, percent: calculatePercentage(spent: transportSpent, budget: transportBudget))
        HStack {
          Text("Spent:")
          TextField("Transport Spent", value: $transportSpent, formatter: NumberFormatter())
            .textFieldStyle(RoundedBorderTextFieldStyle())
            .keyboardType(.decimalPad)
          Text("Budget:")
          TextField("Transport Budget", value: $transportBudget, formatter: NumberFormatter())
            .textFieldStyle(RoundedBorderTextFieldStyle())
            .keyboardType(.decimalPad)
        }
      }
      .padding ()
      VStack(alignment: .leading) {
        Text("Self")
        ProgressBars(width: 200, height: 20, percent: calculatePercentage(spent: selfSpent, budget: selfBudget))
        HStack {
          Text("Spent:")
          TextField("Self Spent", value: $selfSpent, formatter: NumberFormatter())
            .textFieldStyle(RoundedBorderTextFieldStyle())
            .keyboardType(.decimalPad)
          Text("Budget")
          TextField("Self Budget", value: $selfBudget, formatter: NumberFormatter())
            .textFieldStyle(RoundedBorderTextFieldStyle())
            .keyboardType(.decimalPad)
        }
      }
      .padding ()
    }
    Spacer()
      .padding()
  }
    .navigationBarBackButtonHidden(true)
    .toolbar {
      ToolbarItem(placement: .navigationBarLeading) {
        Button(action: {
          presentationMode.wrappedValue.dismiss() //pop the current view
        }) {
          HStack {
            Image(systemName: "chevron.backward")
            Text("Budget Tracker")
          }
          .foregroundColor(Color(hue: 0.781, saturation: 0.321, brightness: 0.947))
        }
      }
    }
}
}
#Preview {
  BudgetOverview()
}
