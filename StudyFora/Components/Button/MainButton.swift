//
//  MainButton.swift
//  StudyFora
//
//  Created by Carissa Farry Hilmi Az Zahra on 07/01/24.
//

import Foundation
import SwiftUI

struct MainButton: ButtonStyle {
    enum BackButtonType {
        case success
        case warning
        case danger
    }
    
    enum ButtonType {
        case normalButton
        case circleButton
        case tabViewButton
    }

    var type = ButtonType.normalButton
    
    var width: CGFloat = 200
    var height: CGFloat = 50
    
    var fontSize = CGFloat(20)
    var cornerRadius: CGFloat = 30
    
    var color: Color = .purpleDark
    var bgColor: Color = .white
    var bgGradientColor: LinearGradient = LinearGradient(gradient: Gradient(colors: [.blueLight, .purpleLight]), startPoint:   .leading, endPoint: .trailing)
    
    func makeBody(configuration: Configuration) -> some View {
        ZStack {
            switch type {
            case .normalButton:
                RoundedRectangle(cornerRadius: cornerRadius)
                    .fill(bgColor)
                    .shadow(radius: 2, y: 1)
                    .frame(width: width, height: height)
            case .tabViewButton:
                RoundedRectangle(cornerRadius: cornerRadius)
                    .fill(bgGradientColor)
                    .shadow(radius: 2, y: 1)
                    .frame(width: width, height: height)
            case .circleButton:
                Circle()
                    .fill(bgColor)
                    .shadow(radius: 2, y: 1)
                    .frame(width: width, height: height)
            }
            
            configuration.label
                .padding()
                .foregroundColor(color)
                .font(.system(size: fontSize))
                .bold()
        }
        .frame(width: width, height: height)
        .scaleEffect(configuration.isPressed ? 1.2 : 1)
        .animation(.easeOut(duration: 0.2), value: configuration.isPressed)
    }
}

struct MainButtonView: View {
    var body: some View {
        Button(action: {}, label: {
            Image(systemName: "arrow.backward")
        })
        .buttonStyle(MainButton(type: .circleButton, width: 50))
//        .background(.gray)
        .padding()
        
        Button(action: {}, label: {
            Text("Invite Friends")
        })
        .buttonStyle(MainButton())
//        .background(.gray)
        .padding()
        
        Button(action: {}, label: {
            Text("FEED")
        })
        .buttonStyle(MainButton(type: .tabViewButton, width: 130))
//        .background(.gray)
        .padding()
    }
}

#Preview {
    MainButtonView()
}
