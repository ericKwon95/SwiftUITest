//
//  ContentView.swift
//  SwiftUITest
//
//  Created by 권승용 on 1/8/25.
//

import SwiftUI

struct ContentView: View {
    @State private var alignment: VerticalAlignment = .top
    
    var body: some View {
        HStack(alignment: alignment) {
            Image(systemName: "person.fill")
                .resizable()
                .scaledToFit()
                .frame(width: 80, height: 80)
            
            VStack {
                Text("Hello")
                Text("World")
            }
            .overlay {
                GeometryReader { geometry in
                    Color.clear
                        .onAppear {
                            if geometry.size.height > 80 {
                                alignment = .center
                            }
                        }
                }
            }
        }
        .padding(16)
        .background(Color.yellow)
    }
}

#Preview {
    ContentView()
}
