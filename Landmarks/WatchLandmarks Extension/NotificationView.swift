import SwiftUI

struct NotificationView: View {
    var title: String?
    var message: String?
    var landmark: Landmark?
    
    
    var body: some View {
        VStack {
            if landmark != nil {
                CircleImage(image: landmark!.image.resizable())
            }
            
            Text(title ?? "Unknown Landmark")
                .font(.headline)
            
            Divider()
            
            Text(message ?? "Within 5 miles of your favorite landmarks.")
                .font(.caption)
        }
        .lineLimit(0)
    }
}

struct NotificationView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            
            NotificationView()
            
            NotificationView(title: "Turtle Rock", message: "Wihin 5 miles of Turtle Rock", landmark: ModelData().landmarks[0])
        }
    }
}
