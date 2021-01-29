//
//  CategoryItem.swift
//  Landmarks
//
//  Created by Tim Colson on 12/30/20.
//

import SwiftUI

struct CategoryItem: View {
    var landmark : Landmark
    var body: some View {
        NavigationLink(destination:LandmarkDetail(landmark: landmark)) {
            
            VStack(alignment: .leading) {
                landmark.image
                    .resizable()
                    .frame(width: 100, height: 100)
                    .cornerRadius(5)
                Text(landmark.name)
                    .font(.system(size:14))
                    .lineLimit(2)
                    .frame(width: 100, alignment: .leading)
            }
            .padding(.leading, 15)
        }
    }
}

struct CategoryItem_Previews: PreviewProvider {
    static var previews: some View {
        CategoryItem(landmark: ModelData().landmarks[1])
    }
}
