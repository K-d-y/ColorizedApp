//
//  ContentView.swift
//  ColorizedApp
//
//  Created by Dmitry Knauer on 17.05.2022.
//

import SwiftUI

struct ContentView: View {
    @State private var redColor = Double.random(in: 0...255)
    @State private var greenColor = Double.random(in: 0...255)
    @State private var blueColor = Double.random(in: 0...255)
    
    @FocusState private var focusedField: Field?
    
    var body: some View {
        ZStack {
            Color(#colorLiteral(red: 0, green: 0.3765624762, blue: 0.7304599881, alpha: 1))
                .ignoresSafeArea()
                .onTapGesture {
                    focusedField = nil
                }
            
            VStack(spacing: 40) {
                ColorView(redColor: redColor, greenColor: greenColor, blueColor: blueColor)
                
                VStack {
                    ColorSliderView(value: $redColor, color: .red)
                        .focused($focusedField, equals: .red)
                    ColorSliderView(value: $greenColor, color: .green)
                        .focused($focusedField, equals: .green)
                    ColorSliderView(value: $blueColor, color: .blue)
                        .focused($focusedField, equals: .blue)
                }
                .frame(height: 150)
                .toolbar {
                    ToolbarItemGroup(placement: .keyboard) {
                        Button(action: previousField) {
                            Image(systemName: "chevron.up")
                        }
                        Button(action: nextField) {
                            Image(systemName: "chevron.down")
                        }
                        Spacer()
                        Button("Done") {
                            focusedField = nil
                        }
                    }
                }
                Spacer()
            }
            .padding()
        }
    }
}

extension ContentView {
    private enum Field {
        case red
        case green
        case blue
    }
    
    private func nextField() {
        switch focusedField {
        case .red:
            focusedField = .green
        case .green:
            focusedField = .blue
        case .blue:
            focusedField = .red
        case .none:
            focusedField = nil
        }
    }
    
    private func previousField() {
        switch focusedField {
        case .red:
            focusedField = .blue
        case .green:
            focusedField = .red
        case .blue:
            focusedField = .green
        case .none:
            focusedField = nil
        }
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
