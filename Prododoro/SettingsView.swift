//
//  SettingsView.swift
//  Prododoro
//
//  Created by Karen Diaz on 6/27/24.
//

import SwiftUI

struct SettingsView: View {
    @AppStorage("isDarkMode") private var isDarkMode = false
    
    var body: some View {
        ZStack(alignment: .top) {
            Color.accentDilute
                .edgesIgnoringSafeArea(.all)
            
            VStack(alignment: .trailing) {
                Color.accentMain
                    .frame(height: 98)
                    .edgesIgnoringSafeArea(.top)
                VStack(alignment: .trailing) {
                    
                    //dark mode setting toggle
                    Text("Dark Mode")
                        .foregroundColor(.black)
                        .font(.headline)
                        .padding(.top, 10)
                    Toggle("", isOn : $isDarkMode)
                    
                    //pomodoro alarm volume
                    Text("Alert Volume")
                        .foregroundColor(.black)
                        .font(.headline)
                        .padding(.top, 30)
                    
                    Spacer()
                }
                .padding()
                .frame(maxWidth: .infinity, alignment: .trailing)
                .background(Color.accentDilute)
            }
        }
    }
}
#Preview {
    SettingsView()
}

