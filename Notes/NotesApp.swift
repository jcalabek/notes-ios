import SwiftUI

@main
struct NotesApp: App {
    @ObservedObject static var coreDataStack = CoreDataStack()

    var body: some Scene {
        WindowGroup {
            MainView()
                .environment(\.managedObjectContext, NotesApp.coreDataStack.container.viewContext)
        }
    }
}
