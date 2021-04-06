//
//  ContentView.swift
//  HW3.4
//
//  Created by Nikita Zharinov on 06/04/2021.
//

import SwiftUI

struct ContentView: View {
    @State private var targetValue = Int.random(in: 0...100)
    @State private var sliderValue = 50.0
    @State var showAResult = false
    let color: UIColor
    
    var body: some View {
        VStack {
            Text("Подвинь слайдер как можно ближе к : \(targetValue)")
                .font(.footnote)
            HStack {
                Text("0")
                ColorUISlider(color: color,
                              sliderValue: $sliderValue,
                              alpha: .constant(Double(computeScore())/100.0))
                    .accentColor(Color(color))
                    .frame(width: 300, height: 50)
                Text("100")
            }
            
            Button(action: { showAResult = true } ) {
                Text("Проверь меня!")
            }
            .alert(isPresented: $showAResult) {
                Alert(title: Text("Your Score"),
                      message: Text("\(computeScore())"))
            }
            .padding()
            Button(action: { newGame() }) {
                Text("Новая игра")
            }
        }
    }
    
    private func newGame() {
        targetValue = Int.random(in: 0...100)
        sliderValue = 50.0
    }
    
    private func computeScore() -> Int {
        let difference = abs(targetValue - lround(sliderValue))
        return 100 - difference
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView(color: .green)
    }
}
