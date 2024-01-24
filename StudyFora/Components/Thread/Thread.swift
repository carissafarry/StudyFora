//
//  Thread.swift
//  StudyFora
//
//  Created by Carissa Farry Hilmi Az Zahra on 23/01/24.
//

import SwiftUI

struct Thread: View {
    var bookmarked: Bool = false
    var attachment: String?
    
    var body: some View {
        ZStack {
            VStack {
                HStack(alignment: .top) {
                    PhotoFrame(width: 43)
//                        .padding(.trailing, 10)
                        .padding(.vertical, -8)
//                        .background(.gray)

                    VStack(alignment:.leading) {
                        Text("Roopesh Aggarwal")
                            .font(.headline)
                            .bold()
                            .padding(.bottom, 2)
                        Text("1h ago")
                            .font(.footnote)
                    }
                    Spacer()
                    Image(systemName: bookmarked ? "bookmark.fill" : "bookmark")
                        .font(.title3)
                }
                .padding(.bottom, 5)
                
                VStack(spacing: 15) {
                    Text("Has anyone solves this problem of quadratic equation? I'm unable to wrap my head around it. Has anyone solves this problem of quadratic equation? I'm unable to wrap my head around it.")
                        .font(.footnote)
                        .multilineTextAlignment(.leading)
                        .frame(maxWidth: .infinity)
//                        .background(.gray)
                    
                    if (attachment != nil) {
                        Image(attachment!)
                            .resizable().scaledToFill()
                            .frame(maxWidth: .infinity, minHeight: 100)
                            .background(.gray)
                            .cornerRadius(10)
                            .padding(.bottom, 8)
                    } else {
                        Spacer()
                    }
                }
//                .background(.green)
                
                HStack(spacing: 50) {
                    HStack {
                        Image(systemName: "arrowtriangle.up.square.fill")
                        Text("234 upvotes")
                    }
                    
                    HStack {
                        Image(systemName: "bubble.right.fill")
                        Text("42 comments")
                    }
                }
                .font(.footnote)
            }
//            .background(.yellow)
            .padding(20)
        }
        .frame(width: 350)
        .fixedSize(horizontal: false, vertical: true)
        .background(.white)
        .clipShape(RoundedRectangle(cornerRadius: 20))
        .shadow(radius: 4, y: 3)
    }
}

#Preview {
//    Thread()
    Thread(attachment: "Component/Thread/q2")
}
