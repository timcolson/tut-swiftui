import SwiftUI

struct LandmarkDetail: View {
    
    @EnvironmentObject var modelData: ModelData
    var landmark: Landmark
    
    var landmarkIndex: Int {
        modelData.landmarks.firstIndex(
            where: {$0.id == landmark.id}
        )!
    }
    
    var body: some View {
        ScrollView {
            MapView(coordinate: landmark.locationCoordinate)
                .ignoresSafeArea(edges: .top)
                .frame(height: 300)
            
            
            VStack(alignment: .leading, spacing: 20) {
                HStack(spacing: 24) {
                    CircleImage(image: landmark.image.resizable(), roundingRadius: 60)
                        .frame(width:160, height:160)
                    
                    VStack (alignment: .leading) {
                        HStack {
                            Text(landmark.name)
                                .font(.title)
                                .foregroundColor(.primary)
                            
                            FavoriteButton(isSet: $modelData.landmarks[landmarkIndex].isFavorite)
                                .buttonStyle(PlainButtonStyle())
                        }
                        
                        VStack {
                            Text(landmark.park)
                            Text(landmark.state)
                        }
                        .font(.subheadline)
                        .foregroundColor(.secondary)
                        
                    }
                }
                Divider()
                
                Text("About \(landmark.name)")
                    .font(.title2)
                Text(landmark.description)
            }
            .padding()
            .frame(maxWidth:700)
            .offset(y: -50)
        }
        .navigationTitle(landmark.name)
        
    }
}

struct LandmarkDetail_Previews: PreviewProvider {
    
    static var previews: some View {
        
        let modelData = ModelData()
        
        LandmarkDetail(landmark: ModelData().landmarks[0])
            .environmentObject(modelData)
        
    }
}
