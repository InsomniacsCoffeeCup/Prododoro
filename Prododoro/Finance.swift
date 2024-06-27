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
    
    //make the navbar at the top have a set colour (you can see the settings and nav menus on dark mode now!)
    init() {
        let appearance = UINavigationBarAppearance()
        appearance.configureWithOpaqueBackground()
        appearance.backgroundColor = UIColor(named: "accentMain")
        UINavigationBar.appearance().standardAppearance = appearance
        UINavigationBar.appearance().scrollEdgeAppearance = appearance
    }

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
    
    
    return NavigationView{
        GeometryReader { geometry in
            ZStack(alignment: .topLeading){
                Color.accentMain
                    .frame(height: geometry.safeAreaInsets.top)
                    .edgesIgnoringSafeArea(.top)
                
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
                    )
                    
        )
    }
    
                }
                }

struct FinanceView: View {
    
    //vars for menu controls
@Binding var showMenu:  Bool
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
      VStack (alignment: .leading){
        HStack {
          Text("Today: ")
          DatePicker("", selection: $selectedDate, displayedComponents: .date)
        }
        .font(.headline)
        .padding()
        HStack {
          Text("Total Spending: \(totalSpending, specifier: "%.2f")")
          Spacer()
          Button(action: {
            updateTotalSpending() //calls function to update total spending
          }) {
            Text("Update")
          }
        }
        .padding()
        HStack {
          Text("Trasnportation: \(transportExpense, specifier: "%.2f")")
          Spacer()
          TextField("Enter amount", value: $transportExpense, formatter: NumberFormatter())
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
//        HStack {
//          NavigationLink(destination: budgetoverview()) {
//            Text("View Budget Overview")
//          Spacer()
//          NavigationLink(destination: FinanceTips()) {
//              Text("Finance Tips!")
//            }
//          }
//          }
          .padding()
        VStack (alignment: .leading) {
          Text("Upcoming Reminders")
            .font(.headline)
            .padding(.top)
            .padding()
          HStack {
            Text("Bill: \(upcomingBill) on \(billDate, formatter: dateFormatter)")
            Spacer()
            Button(action: {
              isEditingBillDate.toggle()
            }) {
              Text("Edit")
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
          Text("Savings Goal: \(savingsGoal, specifier: "%.2f") by \(savingsDate, formatter: dateFormatter)")
          Spacer()
          Text("hello")
        }
        }
        }
      }
    }

  #Preview {
      Finance()
  }


