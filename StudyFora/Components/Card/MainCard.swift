//
//  MainCard.swift
//  StudyFora
//
//  Created by Carissa Farry Hilmi Az Zahra on 23/01/24.
//

import SwiftUI

struct MainCard: View {
    enum CardType {
        case challenge
        case room
        case group
    }
    
    var unit = "members"
    var total = 983
    
    var body: some View {
        HStack {
            
            VStack {
                Text("1.8k members")
                    .font(.footnote)
                    .frame(maxWidth: .infinity, alignment:.leading)
//                    .background(.white)
                
                Spacer()
                
                Text("Topography Map Challenge ")
                    .font(.system(size: 14))
                    .frame(maxWidth: .infinity, alignment:.leading)
                    .multilineTextAlignment(.leading)
//                    .background(.green)
            }
//            .background(.yellow)
            .padding(13)
//            .background(.gray)
            .frame(width: 150, height: 90)
            .background(.white)
            .clipShape(RoundedRectangle(cornerRadius: 10))
            .shadow(radius: 2, y: 0)
        }
        
    }
}

#Preview {
    MainCard()
}
