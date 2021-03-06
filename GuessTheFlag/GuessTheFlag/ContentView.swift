//
//  ContentView.swift
//  GuessTheFlag
//
//  Created by Heather Mason on 1/20/20.
//  Copyright © 2020 Heather Mason. All rights reserved.
//

import SwiftUI

struct Title: ViewModifier {
    func body(content: Content) -> some View {
        content
            .font(.largeTitle)
            .foregroundColor(.blue)
    }
}

struct Flag: ViewModifier {
    func body(content: Content) -> some View {
        content
            .clipShape(Capsule())
            .overlay(Capsule().stroke(Color.black, lineWidth: 1))
            .shadow(color: .black, radius: 2)
    }
}

extension View {
    func titleStyle() -> some View {
        self.modifier(Title())
    }
}

extension View {
    func flagImage() -> some View {
        self.modifier(Flag())
    }
}

struct ContentView: View {
    @State private var countries = ["Estonia", "France", "Germany", "Ireland", "Italy", "Nigeria", "Poland", "Russia", "Spain", "UK", "US"].shuffled()
    @State private var correctAnswer = Int.random(in: 0...2)
    @State private var showingScore = false
    @State private var scoreTitle = ""
    @State private var score = 0
    @State private var countryPicked = ""
    @State private var animationAmount: CGFloat = 0.0
    var opacity: Double = 1

    var body: some View {
        ZStack {
            LinearGradient(gradient: Gradient(colors: [.black, .blue, .black]), startPoint: .top, endPoint: .bottom).edgesIgnoringSafeArea(.all)
            
            VStack(spacing: 30) {
                VStack {
                    Text("Tap the flag of")
                    Text("\(countries[correctAnswer])")
                        .foregroundColor(.white)
                        .font(.largeTitle)
                        .fontWeight(.black)
                        .frame(minWidth: 100, maxWidth: .infinity)
                }
                
                Spacer()
                
                ForEach(0 ..< 3) { number in
                    if number == self.correctAnswer {
                        Button(action: {
                            self.flagTapped(number)
                            withAnimation {
                                self.animationAmount += 360
                            }
                        }) {
                            Image(self.countries[number])
                                .renderingMode(.original)
                                .flagImage()
                        }
                        .rotation3DEffect(.degrees(Double(self.animationAmount)), axis: (x: 0, y: 1, z: 0))
                    } else {
                        Button(action: {
                            self.flagTapped(number)
                        }) {
                            Image(self.countries[number])
                                .renderingMode(.original)
                                .flagImage()
                        }
                    }
                }
                    
                
                Spacer()
                Text("Current score: \(score)")
                Spacer()
            }

        .titleStyle()
            .alert(isPresented: $showingScore) {
                Alert(title: Text(scoreTitle), message: Text("You picked the flag of \(countryPicked)"), dismissButton: .default(Text("Continue")) {
                    self.askQuestion()
                })
            }
        }
    }
    
    func flagTapped(_ number: Int) {
        if number == correctAnswer {
            scoreTitle = "Correct"
            score += 1
        } else {
            scoreTitle = "Wrong"
            score -= 1
        }
        
        countryPicked = countries[number]
        showingScore = true
        animationAmount = 0.0
    }
    
    func askQuestion() {
        countries.shuffle()
        correctAnswer = Int.random(in: 0...2)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
