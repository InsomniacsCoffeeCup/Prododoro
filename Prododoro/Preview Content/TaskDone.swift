//
//  TaskDone.swift
//  Prododoro
//
//  Created by Karen Diaz on 6/27/24.
//

import SwiftUI

struct TaskDone: View {
    let hours: Int
    let minutes: Int
    let seconds: Int
    let taskName: String
    
    var body: some View {
        NavigationStack {
            VStack(alignment: .center) {
                Spacer()
                Text("task complete!")
                    .font(.title)
                    .fontWeight(.heavy)
                    .padding(.bottom, -15)
                Text("_______________________")
                    .padding(.bottom, 20)
                Text("you worked on \(taskName) for")
                    .padding(.bottom, 10)
                VStack(alignment: .leading) {
                    HStack {
                        Text("\(hours)")
                            .font(.title)
                            .fontWeight(.heavy)
                        Text("hours")
                    }
                    HStack {
                        Text("\(minutes)")
                            .font(.title)
                            .fontWeight(.heavy)
                        Text("minutes")
                    }
                    HStack {
                        Text("\(seconds)")
                            .font(.title)
                            .fontWeight(.heavy)
                        Text("seconds")
                    }
                    
                }
                Spacer()
            }
            .padding(.horizontal, 40)
            .navigationBarBackButtonHidden(true)
            VStack {
                NavigationLink(destination: To_Do_()
                    .navigationBarBackButtonHidden(true)) {
                    Image(systemName: "arrow.backward.circle.fill")
                    Text("exit")
                }
                .foregroundColor(Color.black)
                .font(.system(size: 30))
                .fontWeight(.medium)
            }
        }
    }
}


#Preview {
    TaskDone(hours: 0, minutes: 0, seconds: 0, taskName: "")
}
