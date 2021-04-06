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
    var body: some View {
        VStack {
            Text("Подвинь слайдер как можно ближе к : \(targetValue)")
                .font(.footnote)
            slider(sliderValue: $sliderValue)
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
        ContentView()
    }
}

struct slider: View {
    @Binding var sliderValue: Double
    
    var body: some View {
        HStack {
            Text("0")
            Slider(value: $sliderValue, in: 0...100, step: 1)
            Text("100")
        }
        .padding(.horizontal)
    }
    

}
