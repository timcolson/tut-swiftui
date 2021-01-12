import SwiftUI

struct CategoryHome: View {
    @EnvironmentObject var modelData: ModelData
    @State private var showingProfile = false
    
    var body: some View {
        NavigationView {
            List {
                
                modelData.features[0].image
                    .resizable()
                    .scaledToFill()
                    .frame(height:200)
                    .clipped()
                    .listRowInsets(EdgeInsets())
                
                ForEach(modelData.categories.keys.sorted(), id: \.self) {key in
                    CategoryRow(categoryName: key,
                                items: modelData.categories[key]!)
                }
                .listRowInsets(EdgeInsets())
                
            }
            .listStyle(InsetListStyle())
            .navigationTitle("Featured")
            .toolbar{
                ToolbarItem(placement: .automatic) {
                    HStack {
                        Button(action: { showingProfile.toggle() }) {
                            Image(systemName: "person.crop.circle")
                                .accessibilityLabel("User Profile")
                        }
                        
                    }
                }
            }
            .sheet(isPresented: $showingProfile) {
                NavigationView {
                    ProfileHost()
                        .environmentObject(modelData)
                        .navigationBarTitle(Text("Profile"), displayMode: .inline)
                        .navigationBarItems(trailing:
                                                Button( action: {
                                                    print("Dismissing profile view...")
                                                    self.showingProfile = false
                                                }) {
                                                    Text("Done").bold()
                                                    
                                                })
                }
                
                
            }
        }
        
    }
}

struct CategoryHome_Previews: PreviewProvider {
    static var previews: some View {
            CategoryHome()
                .environmentObject(ModelData())
                .statusBar(hidden: true)
    }
}
