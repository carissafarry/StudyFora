//
//  ImagePreview.swift
//  StudyFora
//
//  Created by Carissa Farry Hilmi Az Zahra on 25/01/24.
//

import SwiftUI

struct ImagePreview : View {
    @EnvironmentObject var router: Router
    
    @State var fakeIndex: Int = 0
    var images: [String] = ["Component/Thread/q1", "Component/Thread/q2"]
    
    var body: some View {
        ZStack {
            Color.black.ignoresSafeArea()
            
            TabView(selection: $fakeIndex) {
                ForEach(Array(images.enumerated()), id: \.offset) { (id, image) in
                    Image(image)
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                }
            }
            .tabViewStyle(PageTabViewStyle(indexDisplayMode: .always))
            .overlay(alignment: .topTrailing) {
                Button(action: {
                    withAnimation(.default) {
//                        router.navigateBack()
                    }
                }, label: {
                    Image(systemName: "xmark")
                        .frame(width: 40, height: 40)
                        .foregroundColor(.white)
                        .background(.white.opacity(0.5))
                        .clipShape(Circle())
                        .padding()
                })
            }
        }
    }
}

#Preview {
    ImagePreview()
}
