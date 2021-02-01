import SwiftUI

// 2020-01-31 Not included in the WatchLandmarks Ext Target
// CircleImage (actually a rounded rect) from Phone is used instead


struct CircleImage: View {
    var image: Image
    
    var body: some View {
        image
            .clipShape(Circle())
            .overlay(Circle()
                        .stroke(Color.white, lineWidth: 4))
            .shadow(radius: 8)
    }
}

struct CircleImage_Previews: PreviewProvider {
    static var previews: some View {
        CircleImage(image: Image("turtlerock"))
    }
}
