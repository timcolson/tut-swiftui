import SwiftUI

struct PageView<Page: View>: View {
    var pages: [Page]
    @State private var currentPage = 1
    var debug = true
    
    var body: some View {
        
        VStack {
            PageViewController(pages: pages, currentPage:$currentPage)
            
            if debug {
                Button(action:
                        {currentPage += 1
                         if currentPage >= pages.count {currentPage = 0}
                        })
                {
                    Text("Jump ahead \(currentPage)")
                }
            }
        }
    }
}

struct PageView_Previews: PreviewProvider {
    static var previews: some View {
        PageView(pages: ModelData().features.map { FeatureCard(landmark: $0) })
            .aspectRatio(3 / 2, contentMode: .fit)
    }
}
