//
//  CTABanner.swift
//  StudyFora
//
//  Created by Carissa Farry Hilmi Az Zahra on 23/01/24.
//

import SwiftUI

struct CTABanner: View {
    enum CTABannerType {
        case challengeAFriend
        case newStudyGroup
    }
    
    enum bgType {
        case solid(Color)
        case gradient(LinearGradient)
    }
    
    var type = CTABannerType.newStudyGroup
    
    var width = 350
    var height = 80
    
    var color: Color = .purpleDark
    var header: String = "Create new study group"
    var caption: String = "Add your friends, strangers for your own cause"
    
    var bgColor: bgType = .solid(.white)
    
    var contentColor: Color? {
        switch bgColor {
        case .gradient(_):
            return .white
        default:
            return nil
        }
    }
    
    // TODO: Convert to independent modifiers
    var body: some View {
        if type == CTABannerType.newStudyGroup {
            HStack(alignment: .center, spacing: 20) {
                PhotoFrame(width: 45)
                
                VStack(alignment:.leading) {
                    Text(header)
                        .font(.system(size: 14))
                        .fontWeight(.heavy)
                        .padding(.bottom, 1)
                    Text(caption)
                        .font(.system(size: 11))
                }
//                .background(.yellow)
                .frame(width: 190, height: CGFloat(height), alignment: .leading)
//                .frame(maxWidth: .infinity) // Can not be used if want to change the alignment
                .multilineTextAlignment(.leading)
//                .background(.gray)
                
                Button(action: {}, label: {
                    Image(systemName: "arrow.right")
                })
                .buttonStyle(MainButton(type: .circleButton, width: 35, height: 35, color: color))
//                .background(.green)
            }
            .foregroundColor(contentColor ?? color)
            .frame(alignment: .leading)
            .padding(20)
            .frame(width: 350, height: 80)
            .background(Group {
                switch bgColor {
                case .solid(let color):
                    color
                case .gradient(let linearGradient):
                    linearGradient
                }
            })
            .clipShape(RoundedRectangle(cornerRadius: 20))
            .shadow(radius: 4, y: 3)
        }
    }
}

#Preview {
    // MARK: Background Solid Mode
//    CTABanner(
//        header: "Challenge a friend",
//        caption: "Match your wits with other friends. Play Quizzo now!"
//    )

//    CTABanner(color: .redDark)
    
    // MARK: Background Gradient Mode
    CTABanner(color: .blue, bgColor: .gradient(LinearGradient(gradient: Gradient(colors: [.blue, .purpleDark]), startPoint: .leading, endPoint: .trailing)))
}
