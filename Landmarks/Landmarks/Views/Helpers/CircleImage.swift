import SwiftUI

struct CircleImage: View {
    var image: Image
    
    var body: some View {
        image
            .clipShape(RoundedRectangle(cornerRadius: 42.0))
            .overlay(RoundedRectangle(cornerRadius: 42.0)
                        .stroke(Color.white, lineWidth: 4))
            .shadow(radius: 8)
    }
}

struct CircleImage_Previews: PreviewProvider {
    static var previews: some View {
        CircleImage(image: Image("turtlerock"))
    }
}
