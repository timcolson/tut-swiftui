import SwiftUI

struct CircleImage: View {
    var body: some View {
        Image("turtlerock")
            .clipShape(RoundedRectangle(cornerRadius: 42.0))
            .overlay(RoundedRectangle(cornerRadius: 42.0)
                        .stroke(Color.white, lineWidth: 4))
            .shadow(radius: 8)
    }
}

struct CircleImage_Previews: PreviewProvider {
    static var previews: some View {
        CircleImage()
    }
}
