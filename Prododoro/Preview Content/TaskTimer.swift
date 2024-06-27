//
//  TaskTimer.swift
//  final project timer
//
//  Created by catherine on 6/26/24.
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
    @State var breakTime = false
    var body: some View {
        NavigationStack  {
            VStack {
                Spacer()
                Text("task name")
                    .foregroundColor(Color(.black))
                    .font(.system(size: 30))
                    .fontWeight(.light)
                Text("")
                    .foregroundColor(Color(.black))
                ZStack {
                    Text("\(hours):\(minutes):\(seconds)")
                        .font(.system(size: 80))
                        .fontWeight(.heavy)
                        .padding(.bottom, 20)
                    Text("\(hours):\(minutes):\(seconds)")
                        .font(.system(size: 80))
                        .fontWeight(.heavy)
                        .foregroundColor(Color("accentMain"))
                        .padding(.bottom, 25)
                        .padding(.trailing, 5)
                }
                .padding(.bottom, -30)
                if timerPaused {
                    if ((hours+minutes+seconds) == 0) {
                        VStack (alignment: .center) {
                            Button(action:{self.startTimer()}) {
                                Image(systemName: "play.fill")
                                Text("start")
                            }
                            .foregroundColor(Color.black)
                            .padding(.bottom, 50)
                            .font(.system(size: 30))
                            .fontWeight(.medium)
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
                            .font(.system(size: 30))
                            .fontWeight(.medium)
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
                        .font(.system(size: 30))
                        .fontWeight(.medium)
                    }
                    
                }
                Spacer()
            }
            HStack (spacing:40){
                
                Button(action:{endTaskAlert = true; pauseTimer()}) {
                    Image(systemName: "checkmark.circle.fill")
                    Text("finish")
                }
                .foregroundColor(Color.black)
                .alert("finish the task?", isPresented: $endTaskAlert)
                {
                    NavigationLink(destination: TaskDone(hours:hours, minutes:minutes, seconds:seconds)
                    )
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
            .font(.system(size: 30))
            .fontWeight(.medium)
        }
        .alert("reminder", isPresented: $breakTime) {
            Button("done", role: .cancel) {
            }
        
        }
    message: {
        Text(Variables.breakReminder)
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
                            breakTime = true
                        }
                        else {
                            self.minutes = self.minutes + 1
                            if minutes%30 == 0 {
                                pauseTimer()
                                breakTime = true
                            }
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
