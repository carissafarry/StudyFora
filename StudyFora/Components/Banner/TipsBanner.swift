//
//  TipsBanner.swift
//  StudyFora
//
//  Created by Carissa Farry Hilmi Az Zahra on 23/01/24.
//

import SwiftUI

struct TipsBannerView: View {
    var color: Color = .purpleDark
    var header: String = "Share a thought"
    var caption: String = "Share study tips, articles, doubts, or anything study related"
    
    var body: some View {
        VStack() {
            HStack(alignment: .top, spacing: 20) {
                PhotoFrame()
                
                VStack(alignment:.leading) {
                    Text(header)
                        .font(.headline)
                        .fontWeight(.heavy)
                        .padding(.bottom, 3)
                    Text(caption)
                        .font(.footnote)
                }
//                .background(.yellow)
                .frame(width: 220, alignment: .leading)
//                .frame(maxWidth: .infinity) // Can not be used if want to change the alignment
                .multilineTextAlignment(.leading)
                .foregroundColor(color)
//                .background(.gray)
            }
        }
//        .background(.pink)
        .frame(alignment: .leading)
        .padding(20)
        .frame(width: 350, height: 105)
        .background(.white)
        .clipShape(RoundedRectangle(cornerRadius: 20))
        .shadow(radius: 4, y: 3)
    }
}

#Preview {
    TipsBannerView()
}
