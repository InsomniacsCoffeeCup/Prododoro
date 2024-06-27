//
//  TaskTimer.swift
//  Prododoro
//
//  Created by Karen Diaz on 6/27/24.
//

import SwiftUI

struct TaskTimer: View {
    @State var hours: Int = 0
    @State var minutes: Int = 0
    @State var seconds: Int = 0
    @State var timerPaused: Bool = true
    @State var timer: Timer? = nil
    @State var endTaskAlert = false
    @State var exitTaskAlert = false
    var body: some View {
        NavigationStack  {
            VStack {
                Spacer()
                Text("\(hours):\(minutes):\(seconds)")
                    .foregroundColor(Color(.black))
                    .font(.largeTitle)
                    .fontWeight(.heavy)
                    .padding()
                if timerPaused {
                    if ((hours+minutes+seconds) == 0) {
                        VStack (alignment: .center) {
                            Button(action:{self.startTimer()}) {
                                Image(systemName: "play.fill")
                                Text("start")
                            }
                            .foregroundColor(Color.black)
                            .padding(.bottom, 50)
                            .font(.title3)
                        }
                    }
                    else {
                        VStack {
                            Button(action:{self.startTimer()}) {
                                Image(systemName: "play.fill")
                                Text("resume")
                            }
                            .foregroundColor(Color.black)
                            .padding(.bottom, 50)
                            .font(.title3)
                        }
                    }
                }
                else {
                    VStack {
                        Button(action:{self.pauseTimer()}) {
                            Image(systemName: "pause.fill")
                            Text("pause")
                        }
                        .foregroundColor(Color.black)
                        .padding(.bottom, 50)
                        .font(.title3)
                    }
                    
                }
                Spacer()
            }
            Spacer()
            HStack (spacing:30){
                Button(action:{endTaskAlert = true; pauseTimer()}) {
                    Image(systemName: "checkmark.circle.fill")
                    Text("finish")
                }
                .foregroundColor(Color.black)
                .alert("finish the task?", isPresented: $endTaskAlert) {
                    NavigationLink(destination: TaskDone(hours:hours, minutes:minutes, seconds:seconds))
                    {
                    Text("ok")
                }
                    Button("cancel", role: .cancel) {
                    }
                }
                Button(action:{exitTaskAlert = true; pauseTimer()}) {
                    Image(systemName: "arrow.backward.circle.fill")
                    Text("exit")
                }
                .foregroundColor(Color.black)
                .alert("exit the task?", isPresented: $exitTaskAlert) {
                    NavigationLink(destination: To_Do_())
                    {
                        Text("ok")
                    }
                    Button("cancel", role: .cancel) {
                    }
                }
            message: {
                Text("the timer will still run in the background")
            }
            }
            .font(.title3)
        }
    }
            func startTimer() {
                timerPaused = false
                timer = Timer.scheduledTimer(withTimeInterval: 1, repeats: true) {tempTimer in
                    if self.seconds == 59 {
                        self.seconds = 0
                        if self.minutes == 59 {
                            self.minutes = 0
                            self.hours = self.hours + 1
                        }
                        else {
                            self.minutes = self.minutes + 1
                        }
                    }
                    else {
                        self.seconds = self.seconds + 1
                    }
                }
            }
            func pauseTimer() {
                timerPaused = true
                timer?.invalidate()
                timer = nil
            }
            
        }
    
    
    #Preview {
        TaskTimer()
    }
