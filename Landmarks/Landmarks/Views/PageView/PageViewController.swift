import SwiftUI
import UIKit

struct PageViewController<Page: View>: UIViewControllerRepresentable {
    
    var pages: [Page]
    
    /* SwiftUI calls this makeCoordinator() method before makeUIViewController(context:),
     so that you have access to the coordinator object when configuring your view controller.
    
     You can use this coordinator to implement common Cocoa patterns,
     such as delegates, data sources, and responding to user events via target-action.

     */
    func makeCoordinator() -> Coordinator {
        Coordinator(self)
    }

    func makeUIViewController(context: Context) -> UIPageViewController {
        let pageViewController = UIPageViewController(
            transitionStyle: .scroll,
            navigationOrientation: .horizontal)
        pageViewController.dataSource = context.coordinator
        
        return pageViewController
    }
    
    func updateUIViewController(_ pageViewController: UIPageViewController, context: Context) {
        pageViewController.setViewControllers(
            [context.coordinator.controllers[0]], direction: .forward, animated: true)
    }
    
    class Coordinator : NSObject, UIPageViewControllerDataSource {

        var parent: PageViewController
        var controllers = [UIViewController]()
        
        init(_ pageViewController: PageViewController) {
            parent = pageViewController
            // Q: What does this really do?
            // A: Converts SwiftUI views into UIKit compatible view controllers.
            controllers = parent.pages.map {UIHostingController(rootView: $0) }
        }
        
        // previous view controller in the list
        func pageViewController(_ pageViewController: UIPageViewController, viewControllerBefore viewController: UIViewController) -> UIViewController? {
            guard let index = controllers.firstIndex(of: viewController) else {
                return nil
            }
            if index == 0 {
                return controllers.last
            }
            
            return controllers[index - 1]
        }
        
        // next view controller in the list
        func pageViewController(_ pageViewController: UIPageViewController, viewControllerAfter viewController: UIViewController) -> UIViewController? {
            guard let index = controllers.firstIndex(of: viewController) else {
                return nil
            }
            if index + 1 == controllers.count {
                return controllers.first
            }
            
            return controllers[index + 1]
        }
   
    }
    
}
