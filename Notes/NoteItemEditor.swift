import SwiftUI

struct NoteItemEditor: View {
    private let item: Item
    
    @State private var editorText: String
    
    init(item: Item) {
        self.item = item
        self.editorText = item.text!
    }
    
    var body: some View {
        return TextEditor(text: $editorText)
            .padding(.all)
            .toolbar {
                ToolbarItem {
                    Button(action: {
                        saveItem()
                    }) {
                        Text("Save")
                    }
                }
            }
    }
    
    private func saveItem() {
        item.text = editorText

        do {
            try item.managedObjectContext?.save()
        } catch {
            let nsError = error as NSError
            fatalError("Unresolved error \(nsError), \(nsError.userInfo)")
        }
    }
}
