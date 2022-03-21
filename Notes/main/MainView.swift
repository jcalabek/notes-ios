import SwiftUI

struct MainView: View {
    var body: some View {
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
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        MainView().environment(\.managedObjectContext, PersistenceController.preview.container.viewContext)
    }
}
