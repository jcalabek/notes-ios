import SwiftUI

struct SettingsView: View {
    @State private var isAutoSave: Bool
    
    init() {
        isAutoSave = Prefs.isAutoSave()
    }
    
    var body: some View {
        Form {
            Section(content: {
                Toggle("Autosave", isOn: $isAutoSave)
                    .onTapGesture {
                        let defaults = UserDefaults.standard
                        defaults.set(isAutoSave, forKey: "autosave")
                    }
            }, header: { Text("Base") })
            
            Section(content: {
                Link("Github", destination: URL(string: "https://github.com/kotleni")!)
                Link("Telegram", destination: URL(string: "https://t.me/kotleni")!)
            }, header: { Text("Developer") })
        }
    }
}
