import SwiftUI

struct LandmarkList: View {
    @EnvironmentObject var modelData: ModelData
    @State private var showFavoritesOnly = false
    
    var filteredLandmarks: [Landmark] {
        modelData.landmarks.filter { landmark in
            (!showFavoritesOnly || landmark.isFavorite)
        }
    }
    
    
    var body: some View {
        NavigationView {
            Toggle(isOn: $showFavoritesOnly) {
                Label("Favorites only", systemImage: "star.fill")
            }
            List {
                ForEach (filteredLandmarks) { landmark in
                    NavigationLink(destination: LandmarkDetail(landmark: landmark)) {
                        LandmarkRow(landmark: landmark)
                    }
                }
            }
            .navigationTitle("Landmarks")
            .frame(minWidth: 300)
//            .toolbar {
//                ToolbarItem {
//                    Menu {
//                        Toggle(isOn: $showFavoritesOnly) {
//                            Label("Favorites only", systemImage: "star.fill")
//                        }
//
//                    } label: {
//                        Label("Filter", systemImage: "slider.horizontal.3")
//                    }
//                }
//            }
            
        }
    }
}

struct LandmarkList_Previews: PreviewProvider {
    static var previews: some View {
        
        LandmarkList()
            .environmentObject(ModelData())
        // Additional Preview Device Options (use if needed)
        //        ForEach(["iPhone SE", "iPhone 7 Plus"], id: \.self) { deviceName in
        //            LandmarkList()
        //                .previewDevice(PreviewDevice(rawValue: deviceName))
        //                .previewDisplayName(deviceName)
        //        }
        //
        //        LandmarkList()
        //            .previewDevice(PreviewDevice(rawValue: "iPhone SE (2nd generation)"))
        //            .previewDisplayName("SE 2nd Gen")
    }
}

// Console Debug for SwiftUI
extension View {
    func Print(_ vars: Any...) -> some View {
        for v in vars { print(v) }
        return EmptyView()
    }
}
