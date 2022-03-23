import SwiftUI

struct NoteItemEditor: View {
    @Environment(\.isPresented) var isPresented
    
    private let item: Item
    
    @State private var editorText: String
    
    init(item: Item) {
        self.item = item
        if item.text != nil {
            self.editorText = item.text!
        } else {
            self.editorText = "ERROR"
        }
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
            .onChange(of: isPresented) { isYes in
                if !isYes && PrefsController.isAutoSave() {
                    saveItem()
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
