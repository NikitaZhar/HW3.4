//
//  ColorUISlider.swift
//  HW3.4
//
//  Created by Nikita Zharinov on 06/04/2021.
//

import SwiftUI

struct ColorUISlider: UIViewRepresentable {
    var color: UIColor
    @Binding var sliderValue: Double
    @Binding var alpha: Double
    
    func makeUIView(context: Context) -> UISlider {
        let slider = UISlider(frame: .zero)
        slider.thumbTintColor = color
        slider.minimumValue = 0
        slider.maximumValue = 100
        
        
        slider.addTarget(
            context.coordinator,
            action: #selector(Coordinator.valueChanged),
            for: .valueChanged
        )
        return slider
    }
    
    func updateUIView(_ uiView: UISlider, context: Context) {
        uiView.value = Float(sliderValue)
        uiView.alpha = CGFloat(self.alpha)
        
    }
    
    func makeCoordinator() -> Coordinator {
        Coordinator(value: $sliderValue, alpha: $alpha)
    }
}

extension ColorUISlider {
    class Coordinator: NSObject {
        @Binding var sliderValue: Double
        @Binding var alpha: Double
        
        init(value: Binding<Double>, alpha: Binding<Double>) {
            self._sliderValue = value
            self._alpha = alpha
        }
        
        @objc func valueChanged(_ sender: UISlider) {
            sliderValue = Double(sender.value)
            alpha = Double(sender.alpha)
        }
    }
}

struct ColorUISlider_Previews: PreviewProvider {
    static var previews: some View {
        ColorUISlider(color: .red, sliderValue: .constant(50), alpha: .constant(1.0))
        .previewLayout(.sizeThatFits)
    }
}
