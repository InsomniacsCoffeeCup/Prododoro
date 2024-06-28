//
//  MenuView.swift
//  Final Project
//
//  Created by Karen Diaz on 6/25/24.
//

import SwiftUI

struct MenuView: View {
    var body: some View {
        ZStack(alignment: .top) {
            Color.accentDilute
                .edgesIgnoringSafeArea(.all)
            
            VStack(alignment: .leading) {
                Color.accentMain
                    .frame(height: 98)
                    .edgesIgnoringSafeArea(.top)
                VStack (alignment: .leading) {
                    
                    NavigationLink(destination: ContentView().navigationBarBackButtonHidden(true)) {
                        Text("Home")
                    }
                    .foregroundColor(.black)
                    .font(.headline)
                    .padding(.top, 10)
                    
                    NavigationLink(destination: To_Do_().navigationBarBackButtonHidden(true)) {
                        Text("To Do")
                    }
                    .foregroundColor(.black)
                    .font(.headline)
                    .padding(.top, 30)
                    
                    NavigationLink(destination: Completed().navigationBarBackButtonHidden(true)) {
                        Text("Completed")
                    }
                    .foregroundColor(.black)
                    .font(.headline)
                    .padding(.top, 30)
                    
                    NavigationLink(destination: Finance().navigationBarBackButtonHidden(true)) {
                        Text("Finance")
                    }
                    .foregroundColor(.black)
                    .font(.headline)
                    .padding(.top, 30)
                    
                    NavigationLink(destination: FinanceTips().navigationBarBackButtonHidden(true)) {
                        Text("Finance Tips")
                    }
                    .foregroundColor(.black)
                    .font(.headline)
                    .padding(.top, 30)
                    
                    NavigationLink(destination: BudgetOverview().navigationBarBackButtonHidden(true)) {
                        Text("Budget Overview")
                    }
                    .foregroundColor(.black)
                    .font(.headline)
                    .padding(.top, 30)
                    
                    Spacer()
                }
                .padding()
                .frame(maxWidth: .infinity, alignment: .leading)
                .background(Color.accentDilute)
            }
        }
    }
}
#Preview {
    MenuView()
}

