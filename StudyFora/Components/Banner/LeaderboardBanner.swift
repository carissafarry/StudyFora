//
//  LeaderboardBanner.swift
//  StudyFora
//
//  Created by Carissa Farry Hilmi Az Zahra on 23/01/24.
//

import SwiftUI

struct Score: View {
    var image = "globe.asia.australia.fill"
    var header = "INDIA RANK"
    var score = 2354
    
    var body: some View {
        HStack(alignment: .center) {
            Image(systemName: image)
                .font(.title2)

            VStack(alignment:.leading) {
                Text(header)
                    .font(.caption2)
                    .opacity(0.5)
                Text("\(score)")
                    .font(.headline)
                    .bold()
            }
        }
        .frame(width: 120, alignment: .leading)
//        .background(.blue)
    }
}

struct LeaderboardBanner: View {
    var regionalRank: Int?
    var globalRank: Int?
    var totalPoints: Int?
    
    var body: some View {
        HStack(alignment:.center) {
            VStack(alignment:.leading) {
                LazyVGrid(columns: Array(repeating: GridItem(), count: 2), spacing: 15) {
                    Score(image: "mappin.circle.fill")
//                        .background(.gray)
                    Score(header: "GLOBAL", score: 5246)
//                        .background(.gray)
                    Score(image: "chart.bar.fill", header: "TOTAL POINTS", score: 110)
//                        .background(.gray)
                }
            }
            .frame(maxWidth: .infinity)
//            .background(.yellow)
            
            Button(action: {}, label: {
                Image(systemName: "arrow.right")
            })
            .buttonStyle(MainButton(type: .circleButton, width: 35, height: 35, color: .blue))
            .padding(15)
//                .background(.green)
        }
//        .background(.pink)
        .padding(.leading, 30)
//        .background(.black)
        .frame(width: 350, height: 120)
        .background(.white)
        .clipShape(RoundedRectangle(cornerRadius: 20))
        .shadow(radius: 4, y: 3)
    }
}

#Preview {
    LeaderboardBanner()
}
