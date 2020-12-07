//
//  ContentView.swift
//  NavViewLink
//
//  Created by Tim Colson on 12/7/20.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationView {
            VStack {
                Text("Main Content View")
                    .font(.largeTitle)
                    .fontWeight(.medium)
                    .foregroundColor(Color.blue)
                Spacer()
                NavigationLink(destination: SecondView()) {
                    Text("Awesome Button")
                    .frame(minWidth: 0, maxWidth: 300)
                    .padding()
                    .foregroundColor(.white)
                    .background(
                      LinearGradient(gradient: Gradient(colors: [Color.red, Color.blue]),
                                     startPoint: .leading,
                                     endPoint: .trailing))
                    .cornerRadius(40)
                    .font(.title)
            }
          }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
