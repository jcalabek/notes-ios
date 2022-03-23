import SwiftUI

struct MainView: View {
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
        NotesController.shared.newNote()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        MainView().environment(\.managedObjectContext, PersistenceController.preview.container.viewContext)
    }
}
