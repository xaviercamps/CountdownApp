//
//  PlayerButtonsView.swift
//  Countdown
//
//  Created by Xavier Camps Novi on 24/1/21.
//

import SwiftUI

struct PlayerButtonsView: View {
    
    @Binding var isActive: Bool
    @Binding var timeRemaining: CGFloat
    
    var body: some View {
        VStack {
            HStack(spacing: 25) {
                Button(action: { isActive.toggle() }) {
                    Label("Play", systemImage: "play.fill")
                        .font(.title)
                        
                }
                .disabled(isActive)
                .foregroundColor(isActive ? .gray : .green)
                .disabled(timeRemaining == 0.0 ? true : false)
                .foregroundColor(timeRemaining == 0.0 ? .gray : .green)
                
                Button(action: { isActive.toggle() }) {
                    Label("Pause", systemImage: "pause.fill")
                        .font(.title)
                        
                }
                .foregroundColor(isActive ? .yellow : .gray)
                .disabled(!isActive)
            }
            .offset(x: 0, y: 30)
            
            Spacer()
            
            Button(action: {
                isActive = false
                timeRemaining = 0
            }) {
                Label("Stop", systemImage: "stop.fill")
                    .font(.title)
            }
            .foregroundColor(timeRemaining == 0.0 ? .gray : .red)
            .disabled(timeRemaining == 0.0 ? true : false)
            
            Spacer()
        }
    }
}
