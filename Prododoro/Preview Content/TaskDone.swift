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
    
    var body: some View {
            VStack {
                Text("task complete!")
                    .font(.title)
                    .fontWeight(.heavy)
                    .padding(.bottom, -15)
                Text("_______________________")
                    .padding(.bottom, 20)
                Text("you worked on the task for")
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
            }
            .navigationBarBackButtonHidden(true)
    }
}


#Preview {
    TaskDone(hours: 0, minutes: 0, seconds: 0)
}
