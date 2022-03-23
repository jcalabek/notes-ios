import SwiftUI

@main
struct NotesApp: App {
    var coreDataStack = CoreDataStack.shared

    var body: some Scene {
        WindowGroup {
            MainView()
                .environment(\.managedObjectContext, coreDataStack.container.viewContext)
        }
    }
}
