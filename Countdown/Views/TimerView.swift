//
//  TimerView.swift
//  Countdown
//
//  Created by Xavier Camps Novi on 24/1/21.
//

import SwiftUI

struct TimerDownView: View {
    
    @Binding var isActive: Bool
    @Binding var openConfiguration: Bool
    @Binding var timeRemaining: CGFloat
    @Binding var defaultTimeRemaining: CGFloat
    
    let timer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()
    
    var body: some View {
        ZStack {
            VStack {
                HStack {
                    Spacer()
                    Button(action: {openConfiguration.toggle() }) {
                        Image(systemName: "gearshape")
                            .resizable()
                            .frame(width: 30, height: 30)
                            .disabled(isActive)
                    }
                }
                Spacer()
            }
            Circle()
                .stroke(Color.gray.opacity(0.2), style: StrokeStyle(lineWidth: 20, lineCap: .round))
            Circle()
                .trim(from: 0, to: timeToZero())
                .stroke(isActive ? Color.green : Color.gray, style: StrokeStyle(lineWidth: 20, lineCap: .round))
                .rotationEffect(.degrees(-90))
                .animation(.easeInOut)
            Text("\(timeString(time: timeRemaining))")
                .font(.system(size: 60))
                .frame(height: 80.0)
                .frame(minWidth: 0, maxWidth: 300)
                .foregroundColor(.black)
                .onReceive(timer) { _ in
                    guard isActive else { return }
                    if self.timeRemaining > 0 {
                        self.timeRemaining -= 1
                    } else {
                        isActive = false
                        self.timer.upstream.connect().cancel()
                    }
                }
        }.frame(width: 300, height: 300)
    }
    
    //Convert the time into 24hr (24:00:00) format
    private func timeString(time: CGFloat) -> String {
        let hours   = Int(time) / 3600
        let minutes = Int(time) / 60 % 60
        let seconds = Int(time) % 60
        return String(format:"%02i:%02i:%02i", hours, minutes, seconds)
    }
    
    private func timeToZero() -> CGFloat {
        let value: CGFloat = 1 - (defaultTimeRemaining - timeRemaining) / defaultTimeRemaining
        return value
    }
}
