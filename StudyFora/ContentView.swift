//
//  ContentView.swift
//  StudyFora
//
//  Created by Carissa Farry Hilmi Az Zahra on 24/10/23.
//

import SwiftUI

struct ContentView: View {
    @EnvironmentObject var router: Router
    
    var body: some View {
        VStack {
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundStyle(.tint)
            
            Button("**Register Page**") {
                router.navigate(to: .register)
            }
            .padding(.top, 12)
        }
        .padding()
    }
}

#Preview {
    ContentView()
}
