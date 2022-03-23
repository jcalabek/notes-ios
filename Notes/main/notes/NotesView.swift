import SwiftUI
import CoreData

struct NotesView: View {
    // @ObservedObject var coreData = CoreDataStack.shared
    
    var body: some View {
        VStack {
            List {
                ForEach(NotesController.shared.getItems()) { item in
                    NavigationLink {
                        NoteItemEditor(item: item)
                    } label: {
                        if item.text != nil {
                            NoteItemRow(title: formatLabel(text: item.text!))
                        } else {
                            Text("?")
                        }
                    }
                }
                .onDelete(perform: deleteItems)
            }
        }
    }
    
    private func deleteItems(offsets: IndexSet) {
        withAnimation {
            offsets.map { NotesController.shared.getItems()[$0] }.forEach(NotesController.shared.getContext().delete)

            do {
                try NotesController.shared.getContext().save()
            } catch {
                let nsError = error as NSError
                fatalError("Unresolved error \(nsError), \(nsError.userInfo)")
            }
        }
    }
    
    private func formatLabel(text: String) -> String {
        var label = text
        
        if text.count > 16 {
            label = String(text.prefix(16)).replacingOccurrences(of: "\n", with: "")
            label += "..."
        }
        
        if text.isEmpty {
            label = "..."
        }
        
        return label
    }
}
