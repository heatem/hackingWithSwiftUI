//
//  ContentView.swift
//  RockPaperScissorsLose
//
//  Created by Heather Mason on 1/25/20.
//  Copyright © 2020 Heather Mason. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    var moves = ["rock", "paper", "scissors"]
    @State private var move = Int.random(in: 0 ..< 3)
    @State private var shouldWin = Bool.random()
    @State private var score = 0
    @State private var turns = 0

    var body: some View {
        VStack(spacing: 10) {
            Text("Score: \(score)")
            HStack {
                Text("App's move:")
                Text("\(moves[move])")
                    .font(.title)
            }
            HStack {
                Text("Select the move to:")
                Text("\(shouldWin ? "win" : "lose")")
                    .font(.title)
            }
            
            VStack(spacing: 30) {
                ForEach(0 ..< 3) { number in
                    Button(action: {
                        self.moveTapped(number)
                    }) {
                        Text("\(self.moves[number])")
                    }
                }
            }
        }
        // TODO: add alert to show whether selected the correct button
        // TODO: action should change move and shouldWin
    }
    
    func moveTapped(_ number: Int) {
        // TODO: Update this to account for expected move, not just number (used for testing)
        if number == move {
            score += 1
        } else {
            score -= 1
        }
        
        if turns < 10 {
            turns += 1
        } else {
            // TODO: Alert user to their final score and let them reset/play again
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
