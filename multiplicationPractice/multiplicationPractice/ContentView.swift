//
//  ContentView.swift
//  multiplicationPractice
//
//  Created by Heather Mason on 2/19/20.
//  Copyright © 2020 Heather Mason. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    @State private var isActive = false
    @State private var questionAmount = 2
    @State private var questionAmounts = [5, 10, 15, 20, 24]
    
    var body: some View {
        // TODO: Add alert at end of game
        // options view for isActive = false
        // TODO: Add ZStack with linear gradient for background
        VStack {
            Group {
                Section(header: Text("How many questions do you want to answer?")) {
                    Picker("Questions amount", selection: $questionAmount) {
                        ForEach(0 ..< questionAmounts.count - 1) {
                            Text("\(self.questionAmounts[$0])")
                        }
                        Text("All")
                    }
                    .pickerStyle(SegmentedPickerStyle())
                }
                // select which tables they want to practice from 1 to 12
                // how many questions do they want to answer (segmented picker))
                // button to start game (improvement: alert confirming selection or cancel to change selections)
            }
            .labelsHidden()
            
            // game view, isActive = true
            Group {
                Text("Goodbye, World!")
                // question label
                // answer input
                // enter button
                // score/question count
            }
        }
    }
//    The player needs to select which multiplication tables they want to practice. This could be pressing buttons, or it could be an “Up to…” stepper, going from 1 to 12.
//    The player should be able to select how many questions they want to be asked: 5, 10, 20, or “All”.
//    You should randomly generate as many questions as they asked for, within the difficulty range they asked for. For the “all” case you should generate all possible combinations.
//    If you want to go fully down the “education” route then this is going to be some steppers, a text field and a couple of buttons. I would suggest that’s a good place to start, just to make sure you have the basics covered.
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
