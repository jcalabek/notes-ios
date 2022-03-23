import SwiftUI
import CoreData

class NotesController {
    @Environment(\.managedObjectContext)
    private var viewContext

    @FetchRequest(sortDescriptors: [NSSortDescriptor(keyPath: \Item.timestamp, ascending: true)], animation: .default)
    private var items: FetchedResults<Item>
    
    static var shared: NotesController = {
        let instance = NotesController()
        
        return instance
    }()
    
    func newNote() {
        let newItem = Item(context: viewContext)
        newItem.timestamp = Date()
        newItem.text = "New note"

        do {
            try viewContext.save()
        } catch {
            let nsError = error as NSError
            fatalError("Unresolved error \(nsError), \(nsError.userInfo)")
        }
        
//        withAnimation {
//
//        }
    }
    
    func getItems() -> FetchedResults<Item> {
        return items
    }
    
    func getContext() -> NSManagedObjectContext {
        return viewContext
    }
}
