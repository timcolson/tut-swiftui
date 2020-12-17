//
//  ContentView.swift
//  Landmarks
//
//  Created by Tim Colson on 12/6/20.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            MapView()
                .ignoresSafeArea(edges: .top)
                .frame(height: 300)
            
            CircleImage()
                .offset(y: -130)
                .padding(.bottom, -130)
            
            VStack (alignment: .leading) {
                Text("Turtle Rock")
                    .font(.title)
                HStack {
                    Text("Joshua Tree Nat'l Park")
                    Spacer()
                    Text("California")
                }
                .font(.subheadline)
                .foregroundColor(.gray)

                Divider()
                
                Text("About Turtle Rock")
                    .font(.title2)
                Text("Descriptive text goes here.")
                
            }
            .padding(25)
            Spacer()
            
            
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            
            ContentView()
                .preferredColorScheme(.dark)
                .previewLayout(.fixed(width: 1112, height: 834))
        }
        
    }
    
}
