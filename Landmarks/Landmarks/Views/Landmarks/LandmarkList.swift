import SwiftUI

struct LandmarkList: View {
    @EnvironmentObject var modelData: ModelData
    @State private var showFavoritesOnly = false
    @State private var filter = FilterCategory.all
    
    enum FilterCategory: String, CaseIterable, Identifiable {
        case all = "All"
        case lakes = "Lakes"
        case rivers = "Rivers"
        case mountains = "Mountains"
        
        var id: FilterCategory { self }
    }
    
    var filteredLandmarks: [Landmark] {
        modelData.landmarks.filter { landmark in
            (!showFavoritesOnly || landmark.isFavorite)
                && (filter == .all || filter.rawValue == landmark.category.rawValue)
        }
    }
    
    var title: String {
        let title = filter == .all ? "Landmarks" : filter.rawValue
        return showFavoritesOnly ? "Favorite \(title)" : title
    }
    
    var body: some View {
        NavigationView {
            // Note, on MacOS, it's possible to hide this nav view; no way to restore.
            // Manual fix: Quit app; run the following from terminal:
            // defaults delete com.youridentifier.yourapp
            // Src: https://bit.ly/hackingswift-sidebar-restore
            
            List {
                ForEach (filteredLandmarks) { landmark in
                    NavigationLink(destination: LandmarkDetail(landmark: landmark)) {
                        LandmarkRow(landmark: landmark)
                    }
                }
            }
            .navigationTitle(title)
            .frame(minWidth: 300)
            .toolbar {
                ToolbarItem {
                    Menu {
                        
                        
                        Toggle(isOn: $showFavoritesOnly) {
                            Label(title: {
                                Text("Favorites ONLY")
                                    .foregroundColor(Color.red)
                            }, icon: {
                                Image(systemName: showFavoritesOnly ? "star.fill" : "star")
                                    .renderingMode(.template)
                                    .foregroundColor(showFavoritesOnly ? Color.yellow : Color.blue)
                                    .accentColor(showFavoritesOnly ? Color.yellow : Color.blue)
                                
                            })
                        }
                        
                        Picker("Category", selection: $filter) {
                            ForEach(FilterCategory.allCases) { category in
                                Text(category.rawValue).tag(category)
                            }
                        }.pickerStyle(InlinePickerStyle())
                        
                    } label: {
                        Label("Filter", systemImage: "slider.horizontal.3")
                    }
                }
            }
            // Second view for wide layouts
            Text("Select a Landmark")
            
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
