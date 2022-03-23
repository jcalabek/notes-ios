import SwiftUI

struct MainView: View {
    @Environment(\.managedObjectContext)
    private var viewContext
    
    var body: some View {
        NavigationView {
            TabView {
               NotesView()
                 .tabItem {
                    Image(systemName: "list.dash")
                    Text("Notes")
                  }
                
                SettingsView()
                  .tabItem {
                     Image(systemName: "gear")
                     Text("Settings")
                   }
            }.toolbar {
                ToolbarItem {
                    Button(action: addItem) {
                        Label("Add Item", systemImage: "plus")
                    }
                }
            }
        }
        .toolbar {
            ToolbarItem {
                Button(action: addItem) {
                    Label("Add Item", systemImage: "plus")
                }
            }
        }
    }
    
    private func addItem() {
        let newItem = Item(context: viewContext)
        newItem.timestamp = Date()
        newItem.text = "New note"

        do {
            try viewContext.save()
        } catch {
            let nsError = error as NSError
            fatalError("Unresolved error \(nsError), \(nsError.userInfo)")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        Text("No Preview")
        // MainView().environment(\.managedObjectContext, PersistenceController.preview.container.viewContext)
    }
}
