//
//  PhotoFrame.swift
//  StudyFora
//
//  Created by Carissa Farry Hilmi Az Zahra on 24/01/24.
//

import SwiftUI

struct PhotoFrame: View {
    var image = "Component/User/person1"
    var width = CGFloat(60)
    var height = CGFloat(60)
    
    var body: some View {
        Image(image)
            .resizable()
            .aspectRatio(contentMode: .fit)
            .frame(width: width, height: height)
            .background(.blueLight)
            .clipShape(Circle())
//            .background(.gray)
    }
}

#Preview {
    PhotoFrame()
}
