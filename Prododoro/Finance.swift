//
//  Finance.swift
//  Prododoro
//
//  Created by Karen Diaz on 6/27/24.
//

import SwiftUI

struct Finance: View {
//control for menu
@State private var showMenu = false

//control for settings
@State private var showSettings = false

var body: some View {

    //drag to close menu
    let dragLeft  = DragGesture()
        .onEnded{
            if $0.translation.width < -100 {
                withAnimation{
                    self.showMenu = false
                }
            }
        }
    
    //drag to close settings
    let dragRight = DragGesture()
        .onEnded{
            if $0.translation.width > 100 {
                withAnimation{
                    self.showSettings = false
                }
            }
        }
    
    
    return NavigationView {
        GeometryReader { geometry in
            ZStack(alignment: .topLeading){
                Color.accentMain
                    .frame(height: geometry.safeAreaInsets.top)
                    .edgesIgnoringSafeArea(.top)
                    .zIndex(1)
                FinanceView(showMenu: self.$showMenu, showSettings: self.$showSettings)
                    .frame(width: geometry.size.width, height: geometry.size.height)
                    .offset(x: self.showMenu ? geometry.size.width/2 : 0)
                    .offset(x: self.showSettings ? -geometry.size.width/2 : 0)
                    .disabled(self.showMenu || self.showSettings)
                
                if self.showMenu {
                    MenuView()
                        .frame(width: geometry.size.width/2)
                        .transition(.move(edge: .leading))
                        
                }
                
                if self.showSettings {
                    SettingsView()
                        .frame(width: geometry.size.width/2)
                        .transition(.move(edge: .trailing))
                        .offset(x: geometry.size.width/2)

                }
            }
            .gesture(dragLeft)
            .gesture(dragRight)
            
        }
        
        .navigationBarTitle("Finance", displayMode: .inline)
        .navigationBarItems(leading: (
            Button(action: {
                withAnimation {
                    self.showMenu.toggle()
                }
                
            }) {
                Image("hamburger")
                    .resizable(resizingMode: .stretch)
                    .aspectRatio(contentMode: .fit)
                    .foregroundColor(.black)
                    .frame(width: 40, height: 40)
            }
        ), trailing:(
                Button(action: {
                    withAnimation {
                        self.showSettings.toggle()
                                }
                }) {
                    Image("Gear")
                        .resizable(capInsets: EdgeInsets(top: 0.0, leading: 0.0, bottom: 0.0, trailing: 2.0), resizingMode: .stretch)
                        .aspectRatio(contentMode: .fit)
                        .imageScale(.large)
                        .frame(width: 40, height: 40)
                    
                }
                    ))
    }
    
                }

                }

struct FinanceView: View {
    
    //menu controls
    @Binding var showMenu: Bool
    @Binding var showSettings: Bool
    
    
    @State private var foodExpense: Double = 0 //state variable for food expense
    @State private var transportExpense: Double = 0
    @State private var selfExpense: Double = 0
    @State private var totalSpending: Double = 0
    @State private var budget: Double = 2000 //budget example
    @State private var savingsGoal: Double = 500
    @State private var savingsDate: Date = Date()
    @State private var upcomingBill: String = "Rent" //initial value for upcoming bill
    @State private var billDate: Date = Date()
    @State private var selectedDate: Date = Date()
    @State private var isEditingBillDate: Bool = false //tracks if bill date is being edited
    @State private var isEditingSavingsDate: Bool = false
    @State private var newReminder: String = ""
    @State private var newReminderDate: Date = Date()
    @State private var reminders: [(name: String, date: Date)] = []

    private func updateTotalSpending() {
        totalSpending = foodExpense + transportExpense + selfExpense
    }
    private func numberFormatter() -> NumberFormatter {
        let formatter = NumberFormatter()
        formatter.numberStyle = .decimal
        return formatter
    }
    private let dateFormatter: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateStyle = .long
        return formatter
    }()
    
    var body: some View {
        NavigationView {
            ScrollView {
                VStack(alignment: .leading) {
                    HStack {
                        Text("Today: 🪐🎧🧸🤎")
                        DatePicker("", selection: $selectedDate, displayedComponents: .date)
                        
                    }
                    .font(.headline)
                    .padding(.horizontal)
                    .padding(.vertical)
                    
                    HStack {
                        Text("Total Spending: \(totalSpending, specifier: "%.2f")")
                        Spacer()
                        Button(action: {
                            updateTotalSpending() //calls function to update total spending
                        }) {
                            Text("Update")
                        }
                        .foregroundColor(Color(hue: 0.781, saturation: 0.321, brightness: 0.947))
                    }
                    .padding()
                    HStack {
                        Text("Transportation: \(transportExpense, specifier: "%.2f")")
                        Spacer()
                        TextField("Enter amount", value: $transportExpense, formatter: numberFormatter())
                            .textFieldStyle(RoundedBorderTextFieldStyle()) //styles textfield
                            .keyboardType(.decimalPad)
                    }
                    .padding()
                    HStack {
                        Text("Self: \(selfExpense, specifier: "%.2f")")
                        Spacer()
                        TextField("Enter amount", value: $selfExpense, formatter: numberFormatter())
                            .textFieldStyle(RoundedBorderTextFieldStyle())
                            .keyboardType(.decimalPad)
                    }
                    .padding()
                    HStack {
                        Text("Food: \(foodExpense, specifier: "%.2f")")
                        Spacer()
                        TextField("Enter amount", value: $foodExpense, formatter: numberFormatter())
                            .textFieldStyle(RoundedBorderTextFieldStyle())
                            .keyboardType(.decimalPad)
                    }
                    .padding()
                    HStack {
                        NavigationLink(destination: BudgetOverview()) {
                            Text("View Budget Overview")
                                .foregroundColor(Color(hue: 0.781, saturation: 0.321, brightness: 0.947))
                            Spacer()
                            NavigationLink(destination: FinanceTips()) {
                                Text("Finance Tips!")
                                    .foregroundColor(Color(hue: 0.781, saturation: 0.321, brightness: 0.947))
                            }
                        }
                    }
                    .padding()
                    VStack(alignment: .leading, spacing: 5) {
                        Text("Upcoming Reminders")
                            .font(.headline)
                            .padding(.top)
                            .padding()
                        VStack {
                            ForEach(reminders.indices, id: \.self) { index in
                                HStack {
                                    Text("\(reminders[index].name) on \(reminders[index].date, formatter: dateFormatter)")
                                        .padding()
                                    Spacer()
                                    Button(action: {
                                        reminders.remove(at: index)
                                    }) {
                                        Text("Remove")
                                            .foregroundColor(Color(hue: 1.0, saturation: 0.463, brightness: 0.896))
                                    }
                                }
                            }
                            .padding(.vertical, 1) //padding for each list item
                            .cornerRadius(8)
                        }
                        HStack {
                            TextField("New Reminder", text: $newReminder)
                                .textFieldStyle(RoundedBorderTextFieldStyle())
                            DatePicker("", selection: $newReminderDate, displayedComponents: .date)
                                .labelsHidden()
                            Button(action: {
                                reminders.append((name: newReminder, date: newReminderDate)) //add new reminder to list
                                newReminder = "" //reset new reminder input
                                newReminderDate = Date()
                            }){
                                Text("Add")
                                    .foregroundColor(Color(hue: 0.781, saturation: 0.321, brightness: 0.947))
                            }
                        }
                        .padding()
                    }
                    if isEditingBillDate {
                        DatePicker("Select Bill Date", selection: $billDate, displayedComponents: .date)
                            .datePickerStyle(GraphicalDatePickerStyle())
                            .padding()
                    }
                    HStack {
                        Text("Savings Goal by: \(savingsDate, formatter: dateFormatter)")
                        Spacer()
                        TextField("Enter amount", value: $savingsGoal, formatter: numberFormatter())
                            .textFieldStyle(RoundedBorderTextFieldStyle())
                            .keyboardType(.decimalPad)
                        Button(action: {
                            isEditingSavingsDate.toggle()
                        }) {
                            Text("Edit")
                                .foregroundColor(Color(hue: 0.781, saturation: 0.321, brightness: 0.947))
                        }
                    }
                    .padding()
                    
                    
                    
                    if isEditingSavingsDate {
                        DatePicker("Select Savings Goal Date", selection: $savingsDate, displayedComponents: .date)
                            .datePickerStyle(GraphicalDatePickerStyle())
                            .padding()
                    }
                }
            }
            .padding(.horizontal)
            .navigationBarTitle("Budget Tracker")
            Spacer()
        }
        .navigationViewStyle(StackNavigationViewStyle())
                .accentColor(Color(hue: 0.781, saturation: 0.321, brightness: 0.947))
    }
    
}


#Preview {
    Finance()
}
