//
//  NavigationLink.swift
//  NavViewLink
//
//  Created by Tim Colson on 12/7/20.
//

import SwiftUI

struct SecondView: View {
  var body: some View {
    VStack(
      alignment: .leading,
      spacing: 10
    ) {
      ForEach(
        1...10,
        id: \.self
      ) {
        Text("Item \($0)")
      }
      // TIL that another nav link will nest...
      // i.e. a new " < Back" will be appended to the top
      //NavigationLink(destination: ContentView()) {
      //  Text("Go back!")
      //}
    }
  }
}

struct SecondView_Previews: PreviewProvider {
  static var previews: some View {
    SecondView()
  }
}
