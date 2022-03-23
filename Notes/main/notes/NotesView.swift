import SwiftUI
import CoreData

struct NotesView: View {
    @Environment(\.managedObjectContext)
    private var viewContext

    @FetchRequest(sortDescriptors: [NSSortDescriptor(keyPath: \Item.timestamp, ascending: true)], animation: .default)
    private var items: FetchedResults<Item>
    
    var body: some View {
        VStack {
            List {
                ForEach(items) { item in
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
            offsets.map { items[$0] }.forEach(viewContext.delete)

            do {
                try viewContext.save()
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
