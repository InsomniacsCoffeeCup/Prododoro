//
//  Completed.swift
//  Prododoro
//
//  Created by Karen Diaz on 6/27/24.
//
import SwiftUI
import SwiftData

struct Completed: View {
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
        
        
        return NavigationView{
            GeometryReader { geometry in
                ZStack(alignment: .topLeading){
                    Color.accentMain
                        .frame(height: geometry.safeAreaInsets.top)
                        .edgesIgnoringSafeArea(.top)
                    CompletedView(showMenu: self.$showMenu, showSettings: self.$showSettings)
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
            .navigationBarTitle("Completed Tasks", displayMode: .inline)
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

struct CompletedView: View {
    
    @Binding var showMenu:  Bool
    @Binding var showSettings: Bool
    var body: some View {
        Text("Completed")
    }
    
}

#Preview {
    Completed()
}
