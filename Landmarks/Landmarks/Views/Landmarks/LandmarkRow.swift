import SwiftUI

struct LandmarkRow: View {
    var landmark: Landmark
    
    var body: some View {
        HStack {
            landmark.image
                .resizable()
                .frame(width: 50, height: 50)
                .cornerRadius(10)
            
            VStack(alignment: .leading) {
                Text("\(landmark.name)")
                    .bold()
                #if !os(watchOS)
                Text(landmark.park)
                    .font(.caption)
                    .foregroundColor(.secondary)
                #endif
            }
            Spacer()
            if landmark.isFavorite {
                #if !os(watchOS)
                Image(systemName: "heart.fill")
                    .foregroundColor(.red)
                    .font(Font.system(.largeTitle))
                #else
                Image(systemName: "heart.fill")
                    .foregroundColor(.red)
                    .font(Font.system(.headline))
                #endif
            }
        }
        .padding(.vertical, 4)
    }
}

struct LandmarkRow_Previews: PreviewProvider {
    static var landmarks = ModelData().landmarks
    static var previews: some View {
        Group {
            LandmarkRow(landmark: landmarks[0])
            LandmarkRow(landmark: landmarks[1])
        }
        .previewLayout(.fixed(width: 300, height: 70))
    }
}
