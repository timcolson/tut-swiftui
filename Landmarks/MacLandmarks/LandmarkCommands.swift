import SwiftUI

struct LandmarkCommands: Commands {
        
    var body: some Commands {
        SidebarCommands()
        CommandMenu("Landmark") {
            MenuContent()
        }
    }
    // View to use for the Landmark Menu Command
    private struct MenuContent: View {
        // Apple property magic to track which, if any, component has "focus" (selected)
        @FocusedBinding(\.selectedLandmark) var selectedLandmark
        
        var body: some View {
            Button("\(selectedLandmark?.isFavorite == true ? "Remove" : "Mark") as Favorite") {
                selectedLandmark?.isFavorite.toggle()
            }
            .keyboardShortcut("f", modifiers: [.shift, .option])
            .disabled(selectedLandmark == nil)
        }
    }
}

/*
 See https://developer.apple.com/forums/thread/651748 for explanation
 on how @FocusedBinding works; with sample code.
 */
private struct SelectedLandmarkKey : FocusedValueKey {
    typealias Value = Binding<Landmark>
}

extension FocusedValues {
    var selectedLandmark: Binding<Landmark>? {
        get {self[SelectedLandmarkKey.self] }
        set {self[SelectedLandmarkKey.self] = newValue}
    }
}
