import SwiftUI

struct CircleImage: View {
    var image: Image
    var roundingRadius : CGFloat = 42.0
    
    
    var body: some View {
        image
            .clipShape(RoundedRectangle(cornerRadius: roundingRadius))
            .overlay(RoundedRectangle(cornerRadius: roundingRadius)
                        .stroke(Color.white, lineWidth: 4))
            .shadow(radius: 8)
    }
}

struct CircleImage_Previews: PreviewProvider {
    static var previews: some View {
        CircleImage(image: Image("turtlerock"))
    }
}
