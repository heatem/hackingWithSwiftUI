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
    @State private var turns = 1
    @State private var showingResult = false
    @State private var resultTitle = ""
    @State private var resultMessage = ""

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
    .alert(isPresented: $showingResult) {
        Alert(title: Text(resultTitle), message: Text("You selected the \(resultMessage) move."), dismissButton: .default(Text("Continue")) {
            self.showNextRound()
            })
        }
    }
    
    func moveTapped(_ number: Int) {
        if shouldWin {
            if move == 0 && number != 1 || move == 1 && number != 2 || move == 2 && number != 0 {
                resultTitle = "So sad."
                resultMessage = move == number ? "tying" : "losing"
                score -= 1
            } else {
                resultTitle = "Good job!"
                resultMessage = "winning"
                score += 1
            }
        } else {
            if move == 2 && number != 1 || move == 1 && number != 0 || move == 0 && number != 2 {
                resultTitle = "So sad."
                resultMessage = move == number ? "tying" : "winning"
                score -= 1
            } else {
                resultTitle = "Good job!"
                resultMessage = "losing"
                score += 1
            }
        }
        
        if turns < 10 {
            turns += 1
        } else {
            resultTitle = "Final Score: \(score)"
            score = 0
            turns = 1
            showNextRound()
        }
        
        showingResult = true
    }
    
    func showNextRound() {
        move = Int.random(in: 0 ..< 3)
        shouldWin = Bool.random()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
