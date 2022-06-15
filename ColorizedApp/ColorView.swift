//
//  ColorView.swift
//  ColorizedApp
//
//  Created by Dmitry Knauer on 17.05.2022.
//

import SwiftUI


struct ColorView: View {
    
    let redColor: Double
    let greenColor: Double
    let blueColor: Double
    
    var body: some View {
        Color(red: redColor / 255, green: greenColor / 255, blue: blueColor / 255)
            .cornerRadius(20)
            .frame(height: 130)
            .overlay(
                RoundedRectangle(cornerRadius: 20)
                    .stroke(Color.white, lineWidth: 4)
            )
    }
}

struct ColorView_Previews: PreviewProvider {
    static var previews: some View {
        ColorView(redColor: 100, greenColor: 100, blueColor: 100)
    }
}
