//
//  User.swift
//  StudyFora
//
//  Created by Carissa Farry Hilmi Az Zahra on 23/01/24.
//

import SwiftUI

struct User: View {
    var body: some View {
        HStack(alignment: .center) {
            PhotoFrame(width: 50)
                .padding(.trailing, 10)

            VStack(alignment:.leading) {
                Text("Ramesh Sharma")
                    .font(.headline)
                    .bold()
                    .padding(.bottom, 2)
                Text("213 points")
                    .font(.footnote)
            }
        }
//        .background(.yellow)
    }
}

#Preview {
    User()
}
