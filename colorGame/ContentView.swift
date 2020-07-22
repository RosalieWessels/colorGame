//
//  ContentView.swift
//  colorGame
//
//  Created by Rosalie on 7/20/20.
//  Copyright © 2020 Rosalie. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    @State var score = 0
    @State var timeLeft = 15
    @State var text = "Start"
    @State var color = Color.green
    @State var colorString = "green"
    @State var dictionaryOfColors = [Color.red : "red", Color.green : "green", Color.blue : "blue", Color.black : "black", Color.orange : "orange", Color.yellow : "yellow", Color.purple : "purple", Color.pink : "pink"]
    @State var listOfColors = ["red", "green", "blue", "black", "orange", "yellow", "purple", "pink"]
    
    @State var buttonDisabled = false
    
    var body: some View {
        NavigationView {
            VStack {
                HStack {
                    NavigationLink (destination: InstructionsView()){
                        Text("Instructions").font(.system(size: 20, weight: .bold, design: .rounded))
                        Image(systemName: "info.circle").font(.system(size: 20))
                    }.foregroundColor(.white)
                        .padding()
                        .background(Color.blue)
                        .cornerRadius(20)
                }
                Spacer()
                Text("Score: \(score)")
                    .font(.system(.title, design: .rounded))
                    .foregroundColor(Color(red: 0.902, green: 0.224, blue: 0.275))
                    .padding(.bottom, 30.0)
                Text("Time: \(timeLeft)")
                .font(.system(.title, design: .rounded))
                .foregroundColor(Color(red: 0.902, green: 0.224, blue: 0.275))
                Spacer()
                Text(text).font(.system(size: 60, weight: .black, design: .rounded)).foregroundColor(color).onTapGesture {
                    self.startGame()
                }
                    
                Spacer()
                VStack (spacing: 20){
                    HStack (spacing: 20) {
                        Button(action: {
                            self.checkButtonPress(colorOfButtonPress: "red")
                        }) {
                            Text("Red")
                                .font(.system(size: 20, weight: .bold, design: .rounded))
                                .foregroundColor(.white)
                        }
                        .padding(.vertical, 20)
                        .frame(maxWidth: .infinity)
                        .background(Color.red)
                        .cornerRadius(20)
                        .disabled(buttonDisabled)
                        
                        Button(action: {
                            self.checkButtonPress(colorOfButtonPress: "green")
                        }) {
                            Text("Green")
                                .font(.system(size: 20, weight: .bold, design: .rounded))
                                .foregroundColor(.white)
                        }
                        .padding(.vertical, 20)
                        .frame(maxWidth: .infinity)
                        .background(Color.green)
                        .cornerRadius(20)
                        .disabled(buttonDisabled)
                    }
                    
                    HStack (spacing: 20) {
                        Button(action: {
                            self.checkButtonPress(colorOfButtonPress: "blue")
                        }) {
                            Text("Blue")
                                .font(.system(size: 20, weight: .bold, design: .rounded))
                                .foregroundColor(.white)
                        }
                        .padding(.vertical, 20)
                        .frame(maxWidth: .infinity)
                        .background(Color.blue)
                        .cornerRadius(20)
                        .disabled(buttonDisabled)
                        
                        Button(action: {
                            self.checkButtonPress(colorOfButtonPress: "black")
                        }) {
                            Text("Black")
                                .font(.system(size: 20, weight: .bold, design: .rounded))
                                .foregroundColor(.white)
                        }
                        .padding(.vertical, 20)
                        .frame(maxWidth: .infinity)
                        .background(Color.black)
                        .cornerRadius(20)
                        .disabled(buttonDisabled)
                    }
                    
                    HStack (spacing: 20) {
                        Button(action: {
                            self.checkButtonPress(colorOfButtonPress: "orange")
                        }) {
                            Text("Orange")
                                .font(.system(size: 20, weight: .bold, design: .rounded))
                                .foregroundColor(.white)
                        }
                        .padding(.vertical, 20)
                        .frame(maxWidth: .infinity)
                        .background(Color.orange)
                        .cornerRadius(20)
                        .disabled(buttonDisabled)
                        
                        Button(action: {
                            self.checkButtonPress(colorOfButtonPress: "pink")
                        }) {
                            Text("Pink")
                                .font(.system(size: 20, weight: .bold, design: .rounded))
                                .foregroundColor(.white)
                        }
                        .padding(.vertical, 20)
                        .frame(maxWidth: .infinity)
                        .background(Color.pink)
                        .cornerRadius(20)
                        .disabled(buttonDisabled)
                    }
                    
                    HStack (spacing: 20) {
                        Button(action: {
                            self.checkButtonPress(colorOfButtonPress: "purple")
                            }) {
                            Text("Purple")
                                .font(.system(size: 20, weight: .bold, design: .rounded))
                                .foregroundColor(.white)
                        }
                        .padding(.vertical, 20)
                        .frame(maxWidth: .infinity)
                        .background(Color.purple)
                        .cornerRadius(20)
                        .disabled(buttonDisabled)
                        
                        Button(action: {
                            self.checkButtonPress(colorOfButtonPress: "yellow")
                        }) {
                            Text("Yellow")
                                .font(.system(size: 20, weight: .bold, design: .rounded))
                                .foregroundColor(.white)
                        }
                        .padding(.vertical, 20)
                        .frame(maxWidth: .infinity)
                        .background(Color.yellow)
                        .cornerRadius(20)
                        .disabled(buttonDisabled)
                    }
                }.padding(.horizontal, 20)
                    .navigationBarTitle("Welcome to the Color Game", displayMode: .inline)
            }
        }
    }
    
    func startGame() {
        if timeLeft == 15 {
            buttonDisabled = false

            countDown()
            putInNewColor()
        }
        
        if timeLeft == 0 {
            timeLeft = 15
            score = 0
            text = "Start"
        }
        
    }
    
    func countDown() {
        if timeLeft > 0 {
            let seconds = 1.0
            DispatchQueue.main.asyncAfter(deadline: .now() + seconds) {
                self.timeLeft = self.timeLeft - 1
                self.countDown()
            }
        } else {
            text = "Start Over"
            buttonDisabled = true
        }
    }
    
    func putInNewColor() {
        //Chooses a new color for the text
        color = dictionaryOfColors.keys.randomElement()!
        //Updates the colorString
        colorString = dictionaryOfColors[color]!
        //Update the text to be the name of a random color
        if let index = listOfColors.firstIndex(of: colorString) {
            listOfColors.remove(at: index)
            text = listOfColors.randomElement()!
            listOfColors.append(colorString)
            print("color string", colorString)
            print("text", text)
        }
    }
    
    func checkButtonPress(colorOfButtonPress : String) {
        print("button press", colorOfButtonPress)
        if colorOfButtonPress == colorString {
            print("upping score")
            score = score + 1
            self.putInNewColor()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
