//
//  ContentView.swift
//  Landmarks
//
//  Created by Tim Colson on 12/6/20.
//

import SwiftUI

struct ContentView: View {
  var body: some View {
    VStack (alignment: .leading) {
      Text("Turtle Rock")
        .font(.title)
      HStack {
        CircleImage()
        Text("Joshua Tree National Park")
          .font(.subheadline)
        Spacer()
        Text("California")
          .font(.subheadline)
      }
    }
    .padding(25)
  }
}

struct ContentView_Previews: PreviewProvider {
  static var previews: some View {
    ContentView()
  }
}
