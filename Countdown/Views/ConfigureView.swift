//
//  ConfigureView.swift
//  Countdown
//
//  Created by Xavier Camps Novi on 24/1/21.
//

import SwiftUI

struct ConfigureView: View {
    
    @Binding var openConfiguration: Bool
    @Binding var defaultTimeRemaining: CGFloat
    @Binding var timeRemaining: CGFloat
    
    @State var selectedHoursIndex = 0
    
    var body: some View {
        ZStack {
            VStack {
                Spacer()
                Text("How many hours?")
                    .font(.title)
                Picker(selection: $selectedHoursIndex, label: Text(""), content: {
                    ForEach((1...100), id: \.self) { value in
                        Text("\(value)h")
                        
                    }
                })
                .onChange(of: selectedHoursIndex, perform: { value in
                    self.defaultTimeRemaining = CGFloat(selectedHoursIndex*60*60)
                    self.timeRemaining = defaultTimeRemaining
                })
                
                Button("Save") {
                    openConfiguration = false
                }
                .font(.title2)
                
                Spacer()
            }
        }
        .frame(width: openConfiguration ? UIScreen.main.bounds.size.width - 20 : 0, height: openConfiguration ? 400 : 0)
        .offset(x: 0, y: openConfiguration ? 0 : UIScreen.main.bounds.size.height)
        .background(Color.white)
        .cornerRadius(25)
        .shadow(color: .gray, radius: 10)
    }
}

