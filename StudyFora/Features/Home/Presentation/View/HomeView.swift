//
//  HomeView.swift
//  StudyFora
//
//  Created by Carissa Farry Hilmi Az Zahra on 08/01/24.
//

import SwiftUI

struct HomeView: View {
    @EnvironmentObject var router: Router
    
    var body: some View {
        ScrollView {
            VStack {
                HStack {
                    Button(action: {
                        router.navigateBack()
                    }, label: {
                        Text("Back Button")
                    })
                    
                    Spacer()
                    
                    Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/, label: {
                        Text("Invite Friend")
                    })
                }
                
                HStack() {
                    Text("Study Groups")
                    Spacer()
                }
                .frame(height: Screen.height * 0.2)
//                .background(.gray)
                
                ScrollView(.horizontal, showsIndicators: false) {
                    LazyHGrid(rows: [GridItem(.flexible())]) {
                        ForEach(0..<4) {_ in
                            VStack {
                                Rectangle()
                                    .frame(width: 60, height: 60)
                                    .clipShape(
                                        .rect(cornerRadius: 50, style: .circular)
                                    )
                                    .padding(.bottom, 5)
                                
                                Text("Chemistry")
                                    .font(.footnote)
                            }
                            .frame(width: 80, height: 80)
                        }
                    }
                }
                .frame(height: Screen.height * 0.2)
                
                HStack {
                    Text("My Groups")
                    
                    Spacer()
                    
                    Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/, label: {
                        Text("Saved")
                    })
                }
                
                ScrollView(.horizontal, showsIndicators: false) {
                    LazyHGrid(rows: [GridItem(.flexible())]) {
                        ForEach(0..<4) {_ in 
                            VStack{
                                Rectangle()
                                    .clipShape(.rect(cornerRadius: 10, style: .circular))
                                    .frame(width: Screen.width * 0.4, height: Screen.height * 0.1)
                                    .foregroundColor(.gray)
                            
                                Rectangle()
                                    .clipShape(.rect(cornerRadius: 10, style: .circular))
                                    .frame(width: Screen.width * 0.4, height: Screen.height * 0.1)
                                    .foregroundColor(.gray)
                            }
                        }
                    }
                }
                .padding(.vertical, 20)
            }
            .padding(.horizontal, 20)
        }
    }
}

#Preview {
    HomeView()
}
