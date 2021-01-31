
import SwiftUI

struct LandmarkDetail: View {
    @EnvironmentObject var modelData: ModelData
    var landmark: Landmark
    
    var landmarkIndex: Int {
        modelData.landmarks.firstIndex(where: { $0.id == landmark.id })!
    }
    
    var body: some View {
        Text("Hello LM \(landmarkIndex)")
    }
}

struct LandmarkDetail_Previews: PreviewProvider {
    static var previews: some View {
        
        let modelData = ModelData()
        return LandmarkDetail(landmark: modelData.landmarks[1])
            .environmentObject(modelData)
        
    }
}
